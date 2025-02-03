import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/db.dart';
import 'package:quiz_app/home.dart';
import 'package:quiz_app/question.dart';
import 'package:confetti/confetti.dart'; // Import Confetti library
import 'package:localstore/localstore.dart';

class QuizPage extends StatefulWidget {
  final int difficulty;

  const QuizPage({super.key, required this.difficulty});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int score = 0;
  int index = 0;
  List<Question> loadedQuestions = [];
  late ConfettiController _confettiController; // Confetti controller
  final Localstore _db = Localstore.instance;

  void onAnswerSelected(String value) async {
    // add delay
    await Future.delayed(const Duration(seconds: 1));

    if (value == loadedQuestions[index].correctAnswer) {
      setState(() {
        score++;
      });
    }
    if (index < loadedQuestions.length - 1) {
      setState(() {
        index++;
      });
    } else {
      // Show the AlertDialog and play confetti when quiz is finished
      _showQuizCompletedDialog();
    }
  }

  void loadQuestions() async {
    QuestionStorage questionStorage = QuestionStorage();
    loadedQuestions = await questionStorage.loadQuestions(widget.difficulty);

    // Shuffle the list of questions
    loadedQuestions.shuffle();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    // Initialize the ConfettiController
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
    loadQuestions();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  // Method to show the completion dialog
  void _showQuizCompletedDialog() {
    if (score == loadedQuestions.length) {
      // Unlock the next difficulty level
      _db
          .collection("difficulty")
          .doc("unlockDiff")
          .set({"unlockDiff": widget.difficulty + 1});
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: score < loadedQuestions.length
            ? Text("Better Luck Next Time!")
            : Text(
                'Quiz Completed, New Difficulty Unlocked!',
                textAlign: TextAlign.center,
              ),
        content: Stack(
          alignment: Alignment.center,
          children: [
            // Confetti Widget inside the dialog

            // Dialog Content
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Your score is $score / ${loadedQuestions.length}',
                  style: GoogleFonts.lilitaOne(fontSize: 24),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyHomePage()));
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    // Start the confetti animation
    _confettiController.play();
  }

  @override
  Widget build(BuildContext context) {
    loadedQuestions[index].choices.shuffle();

    return Material(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            forceMaterialTransparency: true,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyHomePage())),
            ),
            title: Text(
              "Score: $score",
              style: GoogleFonts.lilitaOne(),
            ),
          ),
          body: Stack(children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              width: MediaQuery.of(context).size.width,
              child: QuestionWidget(
                  question: loadedQuestions.isNotEmpty
                      ? loadedQuestions[index].question
                      : "empty",
                  choices: loadedQuestions.isNotEmpty
                      ? loadedQuestions[index].choices
                      : [],
                  correctAnswer: loadedQuestions[index].correctAnswer,
                  onAnswerSelected: onAnswerSelected),
            )
          ])),
    );
  }
}

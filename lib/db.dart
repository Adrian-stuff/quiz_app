import 'package:localstore/localstore.dart';

class Question {
  String question;
  List<String> choices;
  String correctAnswer;

  Question(
      {required this.question,
      required this.choices,
      required this.correctAnswer});

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'choices': choices,
      'correctAnswer': correctAnswer,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      question: map['question'] ?? '',
      choices: List<String>.from(map['choices']),
      correctAnswer: map['correctAnswer'] ?? '',
    );
  }
}

class QuestionStorage {
  final Localstore _db = Localstore.instance;
  final String _collectionName = 'questions';

  Future<void> storeQuestions(List<Question> questions, int difficulty) async {
    try {
      final questionMaps = questions.map((q) => q.toMap()).toList();
      questionMaps.forEach((element) async {
        await _db
            .collection("$_collectionName-$difficulty")
            .doc(element["question"])
            .set(element);
      });
    } catch (e) {
      print('Error storing questions: $e');
    }
  }

  Future<List<Question>> loadQuestions(int difficulty) async {
    try {
      final items = await _db.collection("$_collectionName-$difficulty").get();
      if (items != null) {
        final loadedQuestions = <Question>[];
        items.forEach((id, item) {
          loadedQuestions.add(Question.fromMap(item));
        });
        return loadedQuestions;
      } else {
        return [];
      }
    } catch (e) {
      print('Error loading questions: $e');
      return [];
    }
  }
}

// Example usage:
// void main() async {
//   QuestionStorage questionStorage = QuestionStorage();

//   // Sample questions
//   List<Question> questions = [
//     Question(
//       question: 'What is the capital of France?',
//       choices: ['London', 'Berlin', 'Paris', 'Rome'],
//       correctAnswer: 'Paris',
//     ),
//     Question(
//       question: 'Who painted the Mona Lisa?',
//       choices: ['Michelangelo', 'Leonardo da Vinci', 'Raphael', 'Donatello'],
//       correctAnswer: 'Leonardo da Vinci',
//     ),
//   ];

//   // Store questions
//   await questionStorage.storeQuestions(questions);

//   // Load questions
//   List<Question> loadedQuestions = await questionStorage.loadQuestions();
//   print(loadedQuestions);
// }

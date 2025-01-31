import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_background_text/rounded_background_text.dart';
import 'package:confetti/confetti.dart';

class QuestionWidget extends StatefulWidget {
  final String question;
  final List<String> choices;
  final Function(String) onAnswerSelected;
  final String correctAnswer;

  const QuestionWidget({
    super.key,
    required this.question,
    required this.choices,
    required this.onAnswerSelected,
    required this.correctAnswer,
  });

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  String? selectedAnswer;
  late ConfettiController _confettiController;
  bool _isProcessingAnswer = false; // Flag to prevent multiple taps

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 2));
  }

  @override
  void didUpdateWidget(covariant QuestionWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.question != widget.question) {
      setState(() {
        selectedAnswer = null;
        _confettiController.stop();
        _isProcessingAnswer = false; // Reset the flag
      });
    }
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Column(
          children: [
            // Question Text
            Padding(
              padding: EdgeInsets.only(top: deviceHeight * 0.2),
              child: Center(
                child: RoundedBackgroundText(
                  widget.question,
                  style: GoogleFonts.lilitaOne(
                      fontSize: deviceWidth * 0.06, color: Colors.black),
                  textAlign: TextAlign.center,
                  backgroundColor: Colors.white,
                ),
              ),
            ),

            // Answer Buttons
            Expanded(
              child: Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.choices.length,
                  itemBuilder: (context, index) {
                    String choice = widget.choices[index];
                    bool isSelected = choice == selectedAnswer;
                    bool isCorrect = choice == widget.correctAnswer;
                    bool showCorrectAnswer =
                        selectedAnswer != null && isCorrect;

                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: deviceHeight * 0.01,
                          horizontal: deviceWidth * 0.1),
                      child: FilledButton(
                        onPressed:
                            _isProcessingAnswer // Disable button while processing
                                ? () {}
                                : () async {
                                    setState(() {
                                      _isProcessingAnswer =
                                          true; // Set the flag
                                      selectedAnswer = choice;
                                    });

                                    widget.onAnswerSelected(choice);

                                    if (isCorrect) {
                                      _confettiController.play();
                                    }

                                    // Simulate a short delay (optional) to show feedback
                                    await Future.delayed(
                                        const Duration(milliseconds: 500));

                                    setState(() {
                                      _isProcessingAnswer =
                                          false; // Reset the flag
                                    });
                                  },
                        style: FilledButton.styleFrom(
                          minimumSize:
                              Size(deviceWidth * 0.7, deviceHeight * 0.08),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: isSelected
                                  ? (isCorrect ? Colors.green : Colors.red)
                                  : (showCorrectAnswer
                                      ? Colors.green
                                      : Colors.transparent),
                              width: 5.0,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: Text(
                          choice,
                          style: GoogleFonts.lilitaOne(
                              color: Colors.black,
                              fontSize: deviceWidth * 0.05),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),

        // Confetti should be placed on top
        Positioned.fill(
          child: Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: pi / 2, // Downward direction
              emissionFrequency: 0.1,
              numberOfParticles: 20,
              gravity: 0.2,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/quiz.dart';

class DifficultySelection extends StatelessWidget {
  const DifficultySelection({super.key});

  void _navigateToQuizPage(BuildContext context, int difficulty) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            QuizPage(difficulty: difficulty), // Pass difficulty to QuizPage
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsiveness
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      width: deviceWidth,
      height: deviceHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Easy Button
          SizedBox(
            width: deviceWidth * 0.4, // 40% of screen width
            height: deviceHeight * 0.07, // 7% of screen height
            child: ElevatedButton(
              onPressed: () => _navigateToQuizPage(context, 1),
              child: Text(
                'Easy',
                style: GoogleFonts.lilitaOne(fontSize: deviceWidth * 0.05),
              ),
            ),
          ),
          SizedBox(height: deviceHeight * 0.03), // 3% of screen height

          // Medium Button
          SizedBox(
            width: deviceWidth * 0.4,
            height: deviceHeight * 0.07,
            child: ElevatedButton(
              onPressed: () => _navigateToQuizPage(context, 2),
              child: Text(
                'Medium',
                style: GoogleFonts.lilitaOne(fontSize: deviceWidth * 0.05),
              ),
            ),
          ),
          SizedBox(height: deviceHeight * 0.03),

          // Hard Button
          SizedBox(
            width: deviceWidth * 0.4,
            height: deviceHeight * 0.07,
            child: ElevatedButton(
              onPressed: () => _navigateToQuizPage(context, 3),
              child: Text(
                'Hard',
                style: GoogleFonts.lilitaOne(fontSize: deviceWidth * 0.05),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

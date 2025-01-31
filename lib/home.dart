import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/selection.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/images/background.jpg",
              fit: BoxFit.cover,
            ),
          ),

          // Content Centered on the Screen
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20.0), // Space below title
                  child: Text(
                    "Word Master : EAPP Edition",
                    style: GoogleFonts.lilitaOne(
                        fontSize: 44, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),

                // Start Button
                SizedBox(
                  width: 150, // Increased button width for better touch target
                  height: 60, // Increased button height
                  child: FilledButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DifficultySelection(),
                        ),
                      );
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.blue, // Example background color
                      textStyle: GoogleFonts.lilitaOne(
                          fontSize: 20, color: Colors.black),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12), // Button padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                      ),
                    ),
                    child: const Text("Start"),
                  ),
                ),

                const SizedBox(height: 40), // Space between button and credits

                // Credits (Aligned to bottom with padding)
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    "Prepared by :\nBagona, Joey Huxley D.\nCamarillo, Caronne Z.\nEdaga, John Eric N.\nJacob, John Michael C.",
                    style: GoogleFonts.lilitaOne(
                        fontSize: 16, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

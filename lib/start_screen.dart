import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Opacity(
        //   opacity: 0.5,
        //   child: Image.asset(
        //     'assets/images/quiz-logo.png',
        //     width: 300,
        //   ),
        // ),
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(146, 250, 249, 249),
        ),
        const SizedBox(height: 60),
        Text(
          'Learn Flutter the fun way!',
          style: GoogleFonts.pangolin(
            fontSize: 26,
            color: const Color.fromARGB(224, 237, 228, 228),
          ),
        ),
        const SizedBox(height: 40),
        OutlinedButton.icon(
            onPressed: switchScreen,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 18),
              // backgroundColor:
              //     Color.fromARGB(255, 106, 3, 170).withOpacity(0.8),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              "Start Quiz",
            ))
      ],
    );
  }
}

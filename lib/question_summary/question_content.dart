import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/question_summary/question_index.dart';

class QuestionContent extends StatelessWidget {
  const QuestionContent({super.key, required this.data});

  final Map<String, Object> data;

  @override
  Widget build(context) {
    var correctAnswer = data['correct_answer'] == data['user_answer'];
    var index = data['question_index'] as int;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIndex(index: index, correctAnswer: correctAnswer),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (data['question'] as String),
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  (data['correct_answer'] as String),
                  style: const TextStyle(
                      color: Color.fromARGB(134, 255, 255, 255), fontSize: 15),
                ),
                Text(
                  (data['user_answer'] as String),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 81, 164, 231), fontSize: 15),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

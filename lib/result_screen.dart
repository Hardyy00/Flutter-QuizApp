import "package:flutter/material.dart";
import "package:quiz_app/data/data.dart";
import 'package:quiz_app/question_summary/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(void Function() this.switchScreen,
      {super.key, required this.chosenAnswer});

  final List<String> chosenAnswer;
  final void Function() switchScreen;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswer.length; i++) {
      summary.add(
        {
          "question_index": i + 1,
          "question": questions[i].text,
          "correct_answer": questions[i].answer[0],
          "user_answer": chosenAnswer[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(context) {
    var summary = getSummaryData();
    var totalQuestions = summary.length;
    var correctAnswers = summary.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'You answered $correctAnswers out of $totalQuestions questions correctly',
            style: const TextStyle(
                color: Color.fromARGB(182, 255, 255, 255),
                fontSize: 20,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          QuestionSummary(summary: summary),
          const SizedBox(
            height: 40,
          ),
          TextButton.icon(
            onPressed: switchScreen,
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            label: const Text(
              'Restart Quiz!',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

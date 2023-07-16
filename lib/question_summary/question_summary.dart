import 'package:flutter/material.dart';
import "package:quiz_app/question_summary/question_content.dart";

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summary});

  final List<Map<String, Object>> summary;

  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
            children: summary.map((data) {
          return QuestionContent(data: data);
        }).toList()),
      ),
    );
  }
}

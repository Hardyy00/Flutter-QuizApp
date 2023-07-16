import "package:flutter/material.dart";

class QuestionIndex extends StatelessWidget {
  const QuestionIndex(
      {super.key, required this.index, required this.correctAnswer});

  final int index;
  final bool correctAnswer;

  @override
  Widget build(context) {
    return Container(
      alignment: Alignment.center,
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // borderRadius: BorderRadius.circular(5),
        color: correctAnswer ? Colors.blue.shade300 : Colors.pink.shade300,
      ),
      child: Text(
        (index).toString(),
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}

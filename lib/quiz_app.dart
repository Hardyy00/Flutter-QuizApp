import 'package:flutter/material.dart';
import 'package:quiz_app/data/data.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/result_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  // Widget? currentScreen;

  String currentScreen = 'start-screen';
  List<String> answers = [];

  // @override
  // void initState() {
  //   currentScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      // currentScreen = const QuestionScreen();
      if (currentScreen == 'start-screen') {
        currentScreen = 'question-screen';
      } else if (currentScreen == 'result-screen') {
        currentScreen = 'start-screen';
        answers = [];
      }
    });
  }

  void chooseAnswer(String text) {
    answers.add(text);

    if (answers.length == questions.length) {
      setState(() {
        currentScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget activeScreen = StartScreen(switchScreen);

    if (currentScreen == 'question-screen') {
      activeScreen = QuestionScreen(chooseOnTap: chooseAnswer);
    } else if (currentScreen == 'result-screen') {
      activeScreen = ResultScreen(
        switchScreen,
        chosenAnswer: answers,
      );
    }
    return MaterialApp(
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 62, 3, 117),
              Color.fromARGB(255, 116, 5, 185),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        // child: Center(child: currentScreen),
        child: Center(child: activeScreen),
      )),
    );
  }
}

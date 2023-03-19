import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  const Question({super.key, required this.questionText});

  @override
  Widget build(BuildContext context) {
    return Text(questionText, style: const TextStyle(fontWeight: FontWeight.bold),);
  }
}

class QuestionModel {
  final String questionText;
  final List<String> answers;

  const QuestionModel(this.questionText, this.answers);
}

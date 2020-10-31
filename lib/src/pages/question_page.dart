import 'package:flutter/material.dart';
import 'package:flutter_quizapp/src/models/question.dart';

class QuestionPage extends StatefulWidget {
  final List<Question> questions;
  QuestionPage({this.questions});
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  Color colortoshow = Colors.indigoAccent;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks = 0;
  int i = 1;
  bool disableAnswer = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(),
    );
  }
}

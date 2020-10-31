import 'package:flutter/material.dart';
import 'package:flutter_quizapp/src/models/question.dart';
import 'package:flutter_quizapp/src/pages/question_page.dart';
import 'package:flutter_quizapp/src/providers/profesor_provider.dart';

class DoQuizzPage extends StatefulWidget {
  final String idquiz;
  DoQuizzPage({this.idquiz});
  @override
  _DoQuizzPageState createState() => _DoQuizzPageState();
}

class _DoQuizzPageState extends State<DoQuizzPage> {
  ProfesorProvider profesorProvider = new ProfesorProvider();
  List<Question> questions = new List<Question>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: futureQuestions(),
    );
  }

  Widget futureQuestions() {
    return FutureBuilder(
      future: profesorProvider.resolveQuiz(widget.idquiz),
      builder: (context, AsyncSnapshot<List<Question>> snapshot) {
        if (snapshot.hasData) {
          questions = snapshot.data;
          return QuestionPage(questions: questions);
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

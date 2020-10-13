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
  int correct = 0;
  int incorrect = 0;
  int numQuest = 0;
  Color trans = Colors.transparent;
  List<Question> questions = new List<Question>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preguntas"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: futureQuestions(),
      ),
    );
  }

  Widget futureQuestions() {
    return FutureBuilder(
      future: profesorProvider.resolveQuiz(widget.idquiz),
      builder: (context, AsyncSnapshot<List<Question>> snapshot) {
        if (snapshot.hasData) {
          questions = snapshot.data;
          return PageView.builder(
            itemCount: questions.length,
            itemBuilder: (context, index) {
              return QuestionPage(
                question: questions[index],
                number: index + 1,
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

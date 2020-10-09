import 'package:flutter/material.dart';
import 'package:flutter_quizapp/src/models/question.dart';
import 'package:flutter_quizapp/src/providers/profesor_provider.dart';

class DoQuizzPage extends StatefulWidget {
  final String idquiz;
  DoQuizzPage({this.idquiz});
  @override
  _DoQuizzPageState createState() => _DoQuizzPageState();
}

class _DoQuizzPageState extends State<DoQuizzPage> {
  ProfesorProvider profesorProvider = new ProfesorProvider();
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
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return itemQuest(snapshot.data[index]);
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget itemQuest(Question data) {
    return ListTile(
      leading: Icon(Icons.announcement),
      title: Text(data.enunciate),
      subtitle: Column(
        children: [
          Row(
            children: [
              Radio(
                activeColor: Color(0xFF6200EE),
              ),
              Text(data.correctOpt),
            ],
          ),
          Row(
            children: [
              Radio(
                activeColor: Color(0xFF6200EE),
              ),
              Text(data.firstOpt),
            ],
          ),
          Row(
            children: [
              Radio(
                activeColor: Color(0xFF6200EE),
              ),
              Text(data.secOpt),
            ],
          ),
          Row(
            children: [
              Radio(
                activeColor: Color(0xFF6200EE),
              ),
              Text(data.thirdOpt),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_quizapp/src/models/question.dart';

class QuestionPage extends StatefulWidget {
  final Question question;
  final int number;

  QuestionPage({this.question, this.number});
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<String> options = [];
  Color trans = Colors.transparent;
  bool isSelected = false;
  @override
  void initState() {
    fillOptions(widget.question);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Text(widget.number.toString()),
                    ),
                    SizedBox(
                      width: 9.0,
                    ),
                    Text(widget.question.enunciate)
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: ListView.builder(
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    return itemAns(options[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void fillOptions(Question question) {
    options.add(question.correctOpt);
    options.add(question.firstOpt);
    options.add(question.secOpt);
    options.add(question.thirdOpt);
    options.shuffle();
  }

  Widget itemAns(String option) {
    return ListTile(
      onTap: () {
        setState(() {
          if (isSelected == false) {
            trans = Colors.red;
            isSelected = true;
          } else {
            trans = Colors.transparent;
            isSelected = false;
          }
        });
      },
      title: Row(
        children: [
          CircleAvatar(
            child: Text('a'),
            backgroundColor: trans,
          ),
          SizedBox(
            width: 9.0,
          ),
          Text(option)
        ],
      ),
    );
  }
}

// child: ListTile(
//           title: Row(
//             children: [
//               CircleAvatar(
//                 child: Text(widget.number.toString()),
//               ),
//               SizedBox(
//                 width: 9.0,
//               ),
//               Text(widget.question.enunciate)
//             ],
//           ),
//           subtitle: Column(
//             children: [
//               GestureDetector(
//                 child: Container(
//                   child: Text(options[0]),
//                   color: trans,
//                 ),
//                 onTap: () {
//                   setState(() {
//                     trans = Colors.green;
//                   });
//                 },
//               ),
//               GestureDetector(
//                 child: Container(
//                   child: Text(options[1]),
//                   color: trans,
//                 ),
//                 onTap: () {
//                   setState(() {
//                     trans = Colors.green;
//                   });
//                 },
//               ),
//               GestureDetector(
//                 child: Container(
//                   child: Text(options[2]),
//                   color: trans,
//                 ),
//                 onTap: () {
//                   setState(() {
//                     trans = Colors.green;
//                   });
//                 },
//               ),
//               GestureDetector(
//                 child: Container(
//                   child: Text(options[3]),
//                   color: trans,
//                 ),
//                 onTap: () {
//                   setState(() {
//                     trans = Colors.green;
//                   });
//                 },
//               ),
//             ],
//           ),
//         ),

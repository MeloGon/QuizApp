import 'package:flutter/material.dart';

class QuestionOpt extends StatefulWidget {
  final String opt;
  final String correct;
  QuestionOpt({this.opt, this.correct});

  @override
  _QuestionOptState createState() => _QuestionOptState();
}

class _QuestionOptState extends State<QuestionOpt> {
  String selected = "";
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.opt),
      selected: value,
      onTap: () {
        selected = widget.opt;
        setState(() {});
        if (selected == widget.correct) {
          print('si es correcta');
        }
        if (value) {
          value = false;
        } else {
          value = true;
        }
      },
    );
  }
}

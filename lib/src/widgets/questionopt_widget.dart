import 'package:flutter/material.dart';

class QuestionOpt extends StatefulWidget {
  final String opt;
  final bool isSelected;
  QuestionOpt({this.opt, this.isSelected});

  @override
  _QuestionOptState createState() => _QuestionOptState();
}

class _QuestionOptState extends State<QuestionOpt> {
  @override
  Widget build(BuildContext context) {
    bool s = widget.isSelected;
    return ListTile(
      title: Text(widget.opt),
      selected: s,
      onTap: () {
        setState(() {});
        if (s == false) {
          s = true;
        } else {
          s = false;
        }
      },
    );
  }
}

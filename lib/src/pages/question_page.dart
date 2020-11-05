import 'package:flutter/material.dart';
import 'package:flutter_quizapp/src/models/question.dart';
import 'package:flutter_quizapp/src/widgets/optiontile_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class QuestionPage extends StatefulWidget {
  final List<Question> questions;
  QuestionPage({this.questions});

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

int _correct = 0;
int _incorrect = 0;

class _QuestionPageState extends State<QuestionPage> {
  int total = 0;
  Color colortoshow = Colors.indigoAccent;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks = 0;
  int i = 1;
  bool disableAnswer = false;

  @override
  void initState() {
    super.initState();
    _correct = 0;
    _incorrect = 0;
  }

  Question getQuestionModelFromDatasnapshot(Question oneQuestion) {
    Question questionModel = new Question();

    questionModel.enunciate = oneQuestion.enunciate;

    /// shuffling the options
    List<String> options = [
      oneQuestion.firstOpt,
      oneQuestion.secOpt,
      oneQuestion.thirdOpt,
      oneQuestion.fourthOpt
    ];
    options.shuffle();

    questionModel.firstOpt = options[0];
    questionModel.secOpt = options[1];
    questionModel.thirdOpt = options[2];
    questionModel.fourthOpt = options[3];
    questionModel.correctOpt = oneQuestion.firstOpt;
    questionModel.isSelected = false;

    print(questionModel.correctOpt.toLowerCase());

    return questionModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Preguntas'),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                  itemCount: widget.questions.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return QuizPlayTile(
                      questionModel: getQuestionModelFromDatasnapshot(
                          widget.questions[index]),
                      index: index,
                    );
                  }),
              RaisedButton(
                onPressed: () {
                  print(_correct.toString());
                  toast("tu puntaje es $_correct", Colors.black, Colors.white);
                },
                child: Text('Terminar Quiz'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void toast(String msg, Color colorTexto, Color colorbg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: colorbg,
        textColor: colorTexto,
        fontSize: 14.0);
  }
}

class QuizPlayTile extends StatefulWidget {
  final Question questionModel;
  final int index;

  QuizPlayTile({@required this.questionModel, @required this.index});

  @override
  _QuizPlayTileState createState() => _QuizPlayTileState();
}

class _QuizPlayTileState extends State<QuizPlayTile> {
  String optionSelected = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Q${widget.index + 1} ${widget.questionModel.enunciate}",
              style:
                  TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.8)),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.isSelected) {
                ///correct
                if (widget.questionModel.firstOpt ==
                    widget.questionModel.correctOpt) {
                  setState(() {
                    optionSelected = widget.questionModel.firstOpt;
                    widget.questionModel.isSelected = true;
                    _correct = _correct + 1;
                  });
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.firstOpt;
                    widget.questionModel.isSelected = true;
                    _incorrect = _incorrect - 1;
                  });
                }
              }
            },
            child: OptionTile(
              option: "A",
              description: "${widget.questionModel.firstOpt}",
              correctAnswer: widget.questionModel.correctOpt,
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.isSelected) {
                ///correct
                if (widget.questionModel.secOpt ==
                    widget.questionModel.correctOpt) {
                  setState(() {
                    optionSelected = widget.questionModel.secOpt;
                    widget.questionModel.isSelected = true;
                    _correct = _correct + 1;
                  });
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.secOpt;
                    widget.questionModel.isSelected = true;
                    _incorrect = _incorrect - 1;
                  });
                }
              }
            },
            child: OptionTile(
              option: "B",
              description: "${widget.questionModel.secOpt}",
              correctAnswer: widget.questionModel.correctOpt,
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.isSelected) {
                ///correct
                if (widget.questionModel.thirdOpt ==
                    widget.questionModel.correctOpt) {
                  setState(() {
                    optionSelected = widget.questionModel.thirdOpt;
                    widget.questionModel.isSelected = true;
                    _correct = _correct + 1;
                  });
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.thirdOpt;
                    widget.questionModel.isSelected = true;
                    _incorrect = _incorrect - 1;
                  });
                }
              }
            },
            child: OptionTile(
              option: "C",
              description: "${widget.questionModel.thirdOpt}",
              correctAnswer: widget.questionModel.correctOpt,
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.isSelected) {
                ///correct
                if (widget.questionModel.fourthOpt ==
                    widget.questionModel.correctOpt) {
                  setState(() {
                    optionSelected = widget.questionModel.fourthOpt;
                    widget.questionModel.isSelected = true;
                    _correct = _correct + 1;
                  });
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.fourthOpt;
                    widget.questionModel.isSelected = true;
                    _incorrect = _incorrect - 1;
                  });
                }
              }
            },
            child: OptionTile(
              option: "D",
              description: "${widget.questionModel.fourthOpt}",
              correctAnswer: widget.questionModel.correctOpt,
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

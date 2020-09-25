import 'package:flutter/material.dart';
import 'package:flutter_quizapp/src/widgets/header_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EnterPage extends StatefulWidget {
  @override
  _EnterPageState createState() => _EnterPageState();
}

class _EnterPageState extends State<EnterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backgroundLogin(),
          Align(
              alignment: Alignment.bottomCenter,
              child: ContainerUpRounded(
                ht: 0.65,
                raLeft: 50.0,
                raRight: 50.0,
              )),
          Align(
              alignment: Alignment.topCenter,
              child: SvgPicture.asset('assets/images/student.svg')),
          Align(
              alignment: Alignment.bottomCenter,
              child: ContainerUpRounded(
                ht: 0.57,
                raLeft: 35.0,
                raRight: 35.0,
              )),
        ],
      ),
    );
  }

  Widget backgroundLogin() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xff03A641), Color(0xff0AB14A)]),
        ));
  }
}

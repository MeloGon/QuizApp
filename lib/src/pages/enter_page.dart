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
      body: SafeArea(
        child: Stack(
          children: [
            backgroundLogin(),
            Container(
              height: 200.0,
              width: double.infinity,
              child: SvgPicture.asset('assets/images/boys.svg'),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: [
                    ContainerUpRounded(
                      ht: 0.65,
                      raLeft: 50.0,
                      raRight: 50.0,
                    ),
                    Text(
                      'CREA TU USUARIO',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'quicksand',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            Align(
                alignment: Alignment.bottomCenter,
                child: ContainerUpRounded(
                  ht: 0.57,
                  raLeft: 35.0,
                  raRight: 35.0,
                )),
          ],
        ),
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
              colors: [Color(0xff1BB273), Color(0xff169D65)]),
        ));
  }
}

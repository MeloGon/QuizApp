import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContainerUpRounded extends StatelessWidget {
  double ht;
  double raLeft;
  double raRight;
  ContainerUpRounded({this.ht, this.raLeft, this.raRight});
  var _screenSize;
  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    return Container(
      height: _screenSize.height * ht,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xffF2F2F2), Color(0xffFAFAFA)]),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(raLeft),
              topRight: Radius.circular(raRight))),
    );
  }
}

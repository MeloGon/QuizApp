import 'package:flutter/material.dart';
import 'package:flutter_quizapp/src/pages/enter_page.dart';
import 'package:flutter_quizapp/src/pages/listquizz_page.dart';
import 'package:flutter_quizapp/src/pages/loginteach_page.dart';
import 'package:flutter_quizapp/src/pages/menu_page.dart';
import 'package:flutter_quizapp/src/pages/quizzteach_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'menupage',
      routes: {
        'enterpage': (BuildContext context) => EnterPage(),
        'loginteachpage': (BuildContext context) => LoginTeachPage(),
        'menupage': (BuildContext context) => MenuPage(),
        'quizzteachpage': (BuildContext context) => QuizzTeachPage(),
        'listquizzpage': (BuildContext context) => ListQuizzPage(),
      },
    );
  }
}

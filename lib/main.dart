import 'package:flutter/material.dart';
import 'package:flutter_quizapp/src/pages/enter_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'enterpage',
      routes: {
        'enterpage': (BuildContext context) => EnterPage(),
      },
    );
  }
}

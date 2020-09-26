import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuizzTeachPage extends StatefulWidget {
  @override
  _QuizzTeachPageState createState() => _QuizzTeachPageState();
}

class _QuizzTeachPageState extends State<QuizzTeachPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          FlatButton(
              onPressed: () {},
              child: Text('Cerrar Sesion',
                  style:
                      TextStyle(fontFamily: 'quicksand', color: Colors.white)))
        ],
      ),
      body: Stack(children: [
        Opacity(
          opacity: 0.2,
          child: Container(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/images/question.svg',
              height: 180.0,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Column(
              children: [
                Text(
                  'Pregunta 1',
                  style: TextStyle(
                      fontFamily: 'quicksand',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  style: TextStyle(fontFamily: 'quicksand'),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enunciado de la pregunta',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  style: TextStyle(fontFamily: 'quicksand'),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Alternativa 1 (Opcion Correcta)',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  style: TextStyle(fontFamily: 'quicksand'),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Alternativa 2',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  style: TextStyle(fontFamily: 'quicksand'),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Alternativa 3',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  style: TextStyle(fontFamily: 'quicksand'),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Alternativa 4',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Center(
                          child: Text(
                        'Agregar Pregunta',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'quicksand',
                            fontWeight: FontWeight.bold),
                      ))),
                  shape: StadiumBorder(),
                  color: Color(0xff00B0FF),
                ),
                SizedBox(
                  height: 20.0,
                ),
                FlatButton(
                  onPressed: () {},
                  child: Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Center(
                          child: Text(
                        'Terminar',
                        style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'quicksand',
                            fontWeight: FontWeight.bold),
                      ))),
                  shape: StadiumBorder(),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

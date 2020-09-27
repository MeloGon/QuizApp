import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddQuizzPage extends StatefulWidget {
  @override
  _AddQuizzPageState createState() => _AddQuizzPageState();
}

class _AddQuizzPageState extends State<AddQuizzPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            margin: EdgeInsets.only(top: 80.0),
            alignment: Alignment.topCenter,
            child: SvgPicture.asset(
              'assets/images/createquizz.svg',
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
                  'Detalles del nuevo Quizz',
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
                    labelText: 'Titulo del Quizz',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  style: TextStyle(fontFamily: 'quicksand'),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Url de Imagen de fondo',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  style: TextStyle(fontFamily: 'quicksand'),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Resumen del Quizz',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  onPressed: () {
                    return Navigator.pushNamed(context, 'quizzteachpage');
                  },
                  child: Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Center(
                          child: Text(
                        'Crear Quizz',
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
                        'Cancelar',
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

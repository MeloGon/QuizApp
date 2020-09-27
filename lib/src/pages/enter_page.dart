import 'package:flutter/material.dart';
import 'package:flutter_quizapp/src/widgets/header_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EnterPage extends StatefulWidget {
  @override
  _EnterPageState createState() => _EnterPageState();
}

class _EnterPageState extends State<EnterPage> {
  var _screenSize;
  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            backgroundLogin(),
            Container(
              height: _screenSize.height * 0.3,
              width: double.infinity,
              child: SvgPicture.asset(
                'assets/images/studentss.svg',
              ),
            ),
            Align(alignment: Alignment.bottomCenter, child: stackTitle()),
            Align(
                alignment: Alignment.bottomCenter,
                child: contentStack(context)),
          ],
        ),
      ),
    );
  }

  Stack contentStack(BuildContext context) {
    return Stack(
      children: [
        ContainerUpRounded(
          ht: 0.57,
          raLeft: 35.0,
          raRight: 35.0,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
          height: _screenSize.height * 0.55,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Recuerda usar tus nombres verdaderos para recibir tus resultados',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'quicksand', fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  style: TextStyle(fontFamily: 'quicksand'),
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.people_outline),
                    border: OutlineInputBorder(),
                    labelText: 'Nombres Completos',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  style: TextStyle(fontFamily: 'quicksand'),
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.people_outline),
                    border: OutlineInputBorder(),
                    labelText: 'Apellidos Completos',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  style: TextStyle(fontFamily: 'quicksand'),
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.format_list_numbered),
                    border: OutlineInputBorder(),
                    labelText: 'Grado',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  onPressed: () {
                    return Navigator.pushNamed(context, 'listquizzpage');
                  },
                  child: Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Center(
                          child: Text(
                        'INGRESAR',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'quicksand',
                            fontWeight: FontWeight.bold),
                      ))),
                  shape: StadiumBorder(),
                  color: Color(0xff00B0FF),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Copyright @2020 App Prof. Karen Todos los derechos reservados.',
                  style: TextStyle(fontFamily: 'quicksand', fontSize: 12.0),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Stack stackTitle() {
    return Stack(
      children: [
        ContainerUpRounded(
          ht: 0.65,
          raLeft: 50.0,
          raRight: 50.0,
        ),
        Container(
          height: 50.0,
          alignment: Alignment.center,
          width: double.infinity,
          child: Text(
            'CREA TU USUARIO',
            style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'quicksand',
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget backgroundLogin() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [Color(0xff44C5FF), Color(0xff84D9FF)]),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_quizapp/src/providers/profesor_provider.dart';
import 'package:flutter_quizapp/src/widgets/header_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginTeachPage extends StatefulWidget {
  @override
  _LoginTeachPageState createState() => _LoginTeachPageState();
}

class _LoginTeachPageState extends State<LoginTeachPage> {
  var _screenSize;
  ProfesorProvider profesorProvider = new ProfesorProvider();
  TextEditingController txtuserController = new TextEditingController();
  TextEditingController txtpassController = new TextEditingController();

  @override
  void dispose() {
    txtuserController.dispose();
    txtpassController.dispose();
    super.dispose();
  }

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
                'assets/images/teacher.svg',
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
                  'Ingresa tus credenciales para poder empezar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'quicksand', fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: txtuserController,
                  style: TextStyle(fontFamily: 'quicksand'),
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.people_outline),
                    border: OutlineInputBorder(),
                    labelText: 'Usuario',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  obscureText: true,
                  controller: txtpassController,
                  style: TextStyle(fontFamily: 'quicksand'),
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.lock_open),
                    border: OutlineInputBorder(),
                    labelText: 'Contraseña',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  onPressed: () async {
                    toast('Un momento porfavor ..', Colors.black, Colors.white);
                    var rsp = await profesorProvider.loginUser(
                        txtuserController.text, txtpassController.text);
                    if (rsp == true) {
                      toast('Credenciales Correctos', Colors.white,
                          Color(0xff00B0FF));
                      Navigator.pushNamed(context, 'listquizzpage');
                    } else {
                      toast('Credenciales Incorrectos vuelva a intentarlo',
                          Colors.white, Colors.red);
                    }
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
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'registerpage'),
                  child: RichText(
                      text: TextSpan(
                          text: 'No tienes aun una cuenta ?',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'quicksand'),
                          children: <TextSpan>[
                        TextSpan(
                          text: ' Registrate Aqui',
                          style: TextStyle(
                              color: Colors.blueAccent, fontSize: 14.5),
                        )
                      ])),
                ),
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
            'LOGIN',
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

  void toast(String msg, Color colorTexto, Color colorbg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: colorbg,
        textColor: colorTexto,
        fontSize: 14.0);
  }
}

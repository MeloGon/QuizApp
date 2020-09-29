import 'package:flutter/material.dart';

import 'package:flutter_quizapp/src/providers/profesor_provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: txtuserController,
              style: TextStyle(fontFamily: 'quicksand'),
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.people_outline),
                border: OutlineInputBorder(),
                labelText: 'Usuario',
              ),
            ),
            TextField(
              controller: txtpassController,
              style: TextStyle(fontFamily: 'quicksand'),
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.people_outline),
                border: OutlineInputBorder(),
                labelText: 'Contraseña',
              ),
            ),
            RaisedButton(
              onPressed: () {
                //return Navigator.pushNamed(context, 'listquizzpage');
                profesorProvider.createUser(
                    txtuserController.text, txtpassController.text);
              },
              child: Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Center(
                      child: Text(
                    'REGISTRAR',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'quicksand',
                        fontWeight: FontWeight.bold),
                  ))),
              shape: StadiumBorder(),
              color: Color(0xff00B0FF),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ListQuizzPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return Navigator.pushNamed(context, 'addquizzpage');
        },
        child: Icon(Icons.add),
      ),
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    children: [
                      Image.network(
                        'https://pm1.narvii.com/7232/ecfea65be9f50a2d2276270ad63cd6cbe3025adar1-820-720v2_00.jpg',
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Container(
                        color: Colors.black26,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Quizz de Matematica',
                                style: TextStyle(
                                    fontFamily: 'quicksand',
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Todo lo que respecta a sumas y restas',
                                style: TextStyle(
                                    fontFamily: 'quicksand',
                                    fontSize: 13,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

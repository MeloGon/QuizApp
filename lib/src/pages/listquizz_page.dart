import 'package:flutter/material.dart';
import 'package:flutter_quizapp/src/models/quiz.dart';
import 'package:flutter_quizapp/src/providers/profesor_provider.dart';

class ListQuizzPage extends StatelessWidget {
  final ProfesorProvider profesorProvider = new ProfesorProvider();
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
              onPressed: () {
                Navigator.pushNamed(context, 'enterpage');
              },
              child: Text('Cerrar Sesion',
                  style:
                      TextStyle(fontFamily: 'quicksand', color: Colors.white)))
        ],
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: FutureBuilder(
              future: profesorProvider.viewQuizes(),
              builder: (context, AsyncSnapshot<List<Quiz>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return itemListQuiz(context, snapshot.data[index]);
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          )),
    );
  }

  Widget itemListQuiz(BuildContext context, Quiz data) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'doquizzpage');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              Image.network(
                data.urlQuiz,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Container(
                color: Colors.black26,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data.tittleQuiz,
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
                        data.descQuiz,
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
    );
  }
}

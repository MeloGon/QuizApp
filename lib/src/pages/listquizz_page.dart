import 'package:flutter/material.dart';
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
            FutureBuilder(
              future: profesorProvider.viewQuizes(),
              builder: (context, AsyncSnapshot<List<String>> snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return itemListQuiz(context, snapshot.data[index]);
                    },
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  GestureDetector itemListQuiz(BuildContext context, dynamic data) {
    print(data['nom_prof']);
    return GestureDetector(
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
                        data['nom_prof'],
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_quizapp/src/widgets/slideshow_widget.dart';
import 'package:flutter_svg/svg.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff44C5FF), Color(0xff84D9FF)],
        ),
      ),
      child: MiSlideshow(),
    );
  }
}

class MiSlideshow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Slideshow(
      bulletPrimario: 20,
      bulletSecundario: 12,
      // puntosArriba: true,
      colorPrimario: Colors.white,
      slides: <Widget>[
        cardChoice(context, 'ESTUDIANTES', 1, 'assets/images/studentss.svg'),
        cardChoice(context, 'DOCENTE', 2, 'assets/images/teacher.svg'),
      ],
    );
  }

  Widget cardChoice(
      BuildContext context, String texto, int code, String svgImage) {
    return GestureDetector(
      onTap: () {
        switch (code) {
          case 1:
            return Navigator.pushNamed(context, 'enterpage');
          case 2:
            return Navigator.pushNamed(context, 'loginteachpage');
        }
        print('codigo $code');
      },
      child: Card(
        clipBehavior: Clip
            .antiAlias, // nada de lo que este en la tarjeta se salga de la misma
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          children: <Widget>[
            //loading de las imagenes
            Expanded(
              child: SvgPicture.asset(
                svgImage,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              child: Text(
                texto,
                style: TextStyle(
                    fontFamily: 'quicksand',
                    color: Color(0xff00B0FF),
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
            )
          ],
        ),
      ),
    );
  }
}

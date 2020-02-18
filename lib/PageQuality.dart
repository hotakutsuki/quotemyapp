import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Widgets/MyCard.dart';

class QualityPage extends StatelessWidget {
  Function addAnswer;
  String type;
  String title;

  QualityPage(addAnswer, type) {
    this.addAnswer = addAnswer;
    this.type = type;
  }

  List<Widget> questions;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case 'screens':
        title = '¿Cauntas pantallas calculas para tu App?';
        questions = [
          MyCard(
              text: 'de 1 a 10',
              image: AssetImage('assets/answer11.png'),
              color: Colors.lightGreen,
              value: 2,
              action: addAnswer),
          MyCard(
              text: 'de 10 a 20',
              image: AssetImage('assets/answer12.png'),
              color: Colors.orangeAccent,
              value: 4,
              action: addAnswer),
          MyCard(
              text: 'mas de 20',
              image: AssetImage('assets/answer13.png'),
              color: Colors.redAccent,
              value: 6,
              action: addAnswer),
        ];
        break;
      case 'quality':
        title = '¿Qué nivel de calidad estás buscando?';
        questions = [
          MyCard(
              text: 'Calidad Optima',
              image: AssetImage('assets/answer11.png'),
              color: Colors.lightGreen,
              action: addAnswer),
          MyCard(
              text: 'Buena relacion Calidad/Precio',
              image: AssetImage('assets/answer12.png'),
              color: Colors.orangeAccent,
              action: addAnswer),
          MyCard(
              text: 'No me importa tanto la calidad',
              image: AssetImage('assets/answer13.png'),
              color: Colors.redAccent,
              action: addAnswer),
        ];
        break;
      case 'os':
        title = '¿Para qué plataforma?';
        questions = [
          MyCard(
              text: 'Android',
              image: AssetImage('assets/answer21.png'),
              color: Colors.lightGreen,
              value: 3,
              action: addAnswer),
          MyCard(
              text: 'iOS',
              image: AssetImage('assets/answer22.png'),
              color: Colors.white30,
              value: 5,
              action: addAnswer),
          MyCard(
              text: 'Android & iOS',
              color: Colors.blueGrey,
              value: 5,
              image: AssetImage('assets/answer23.png'),
              action: addAnswer),
        ];
        break;
      case 'design':
        title = '¿Qué diseño quieres que tenga tu App?';
        questions = [
          MyCard(
              text: 'Interfaz sencilla',
              image: AssetImage('assets/answer31.png'),
              color: Colors.lightGreen,
              value: 2,
              action: addAnswer),
          MyCard(
              text: 'Interfaz personalizada',
              image: AssetImage('assets/answer32.png'),
              color: Colors.orange,
              value: 3,
              action: addAnswer),
          MyCard(
              text: 'Replicada de web',
              image: AssetImage('assets/answer33.png'),
              color: Colors.blueGrey,
              value: 3,
              action: addAnswer),
          MyCard(
              text: 'Sin diseño',
              image: AssetImage('assets/answer34.png'),
              color: Colors.transparent,
              value: 1,
              action: addAnswer),
        ];
        break;
      case 'monetization':
        title = '¿Cómo quieres sacar beneficio a tu App?';
        questions = [
          MyCard(
              text: 'Gratuita con publicidad',
              image: AssetImage('assets/answer41.png'),
              color: Colors.lightGreen,
              value: 1,
              action: addAnswer),
          MyCard(
              text: 'Aplicacion de pago',
              image: AssetImage('assets/answer42.png'),
              color: Colors.orange,
              value: 2,
              action: addAnswer),
          MyCard(
              text: 'Compras dentro de la app',
              image: AssetImage('assets/answer43.png'),
              color: Colors.blueGrey,
              value: 3,
              action: addAnswer),
          MyCard(
              text: 'Otro / Aún no lo sé',
              image: AssetImage('assets/answer44.png'),
              color: Colors.transparent,
              value: 1,
              action: addAnswer),
        ];
        break;
      case 'login':
        title = '¿Tu App necesita un sistema de login?';
        questions = [
          MyCard(
              text: 'Sí. con Redes sociales y email',
              image: AssetImage('assets/answer51.png'),
              color: Colors.blue,
              value: 3,
              action: addAnswer),
          MyCard(
              text: 'Sí, solo con email',
              image: AssetImage('assets/answer52.png'),
              color: Colors.lightGreen,
              value: 2,
              action: addAnswer),
          MyCard(
              text: 'No',
              image: AssetImage('assets/answer53.png'),
              color: Colors.blueGrey,
              value: 0,
              action: addAnswer),
          MyCard(
              text: 'Aún no lo sé',
              image: AssetImage('assets/answer54.png'),
              color: Colors.transparent,
              value: 1,
              action: addAnswer),
        ];
        break;
      case 'web':
        title = '¿Tu App tiene que estar integrada con un sitio web?';
        questions = [
          MyCard(
              text: 'Sí',
              image: AssetImage('assets/answer61.png'),
              color: Colors.lightGreen,
              value: 2,
              action: addAnswer),
          MyCard(
              text: 'No',
              image: AssetImage('assets/answer62.png'),
              color: Colors.redAccent,
              value: 0,
              action: addAnswer),
          MyCard(
              text: 'Aún no lo sé',
              image: AssetImage('assets/answer63.png'),
              color: Colors.transparent,
              value: 1,
              action: addAnswer),
        ];
        break;
      case 'users':
        title = '¿Los usuarios tienen sus propios perfiles?';
        questions = [
          MyCard(
              text: 'Sí',
              image: AssetImage('assets/answer71.png'),
              color: Colors.lightGreen,
              value: 2,
              action: addAnswer),
          MyCard(
              text: 'No',
              image: AssetImage('assets/answer72.png'),
              color: Colors.redAccent,
              value: 0,
              action: addAnswer),
          MyCard(
              text: 'Aún no lo sé',
              image: AssetImage('assets/answer73.png'),
              color: Colors.transparent,
              value: 1,
              action: addAnswer),
        ];
        break;
      case 'admin':
        title = '¿Tu app necesita un panel de administración?';
        questions = [
          MyCard(
              text: 'Sí',
              image: AssetImage('assets/answer81.png'),
              color: Colors.lightGreen,
              value: 3,
              action: addAnswer),
          MyCard(
              text: 'No',
              image: AssetImage('assets/answer82.png'),
              color: Colors.redAccent,
              value: 0,
              action: addAnswer),
          MyCard(
              text: 'Aún no lo sé',
              image: AssetImage('assets/answer83.png'),
              color: Colors.transparent,
              value: 1,
              action: addAnswer),
        ];
        break;
      case 'languaje':
        title = '¿Qué idiomas usará tu aplicación?';
        questions = [
          MyCard(
              text: 'Sólo uno',
              image: AssetImage('assets/answer91.png'),
              color: Colors.lightGreen,
              value: 0,
              action: addAnswer),
          MyCard(
              text: 'Bilingüe',
              image: AssetImage('assets/answer92.png'),
              color: Colors.teal,
              value: 1,
              action: addAnswer),
          MyCard(
              text: 'Muchos',
              image: AssetImage('assets/answer93.png'),
              color: Colors.blueGrey,
              value: 2,
              action: addAnswer),
        ];
        break;
      case 'state':
      case 'languaje':
        title = '¿En qué estado se encuentra tu proyecto?';
        questions = [
          MyCard(
              text: 'Es una idea',
              image: AssetImage('assets/answer101.png'),
              color: Colors.lightGreen,
              value: 1,
              action: addAnswer),
          MyCard(
              text: 'Ya tengo bocetos',
              image: AssetImage('assets/answer102.png'),
              color: Colors.teal,
              value: 1,
              action: addAnswer),
          MyCard(
              text: 'Esta en desarrollo',
              image: AssetImage('assets/answer103.png'),
              color: Colors.blueGrey,
              value: 1,
              action: addAnswer),
          MyCard(
              text: 'Ya la tengo!',
              image: AssetImage('assets/answer104.png'),
              color: Colors.transparent,
              value: 1,
              action: addAnswer),
        ];
        break;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
        Wrap(children: questions)
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotemyapp/Widgets/RisedGradientButton.dart';

class HomePage extends StatelessWidget {
  PageController controller;

  HomePage(PageController controller) {
    this.controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          padding: EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(style: TextStyle(fontSize: 30), children: [
                TextSpan(text: '¿Cuánto cuesta desarrollar mi'),
                TextSpan(
                    text: ' App?',
                    style: TextStyle(fontSize: 35, color: Colors.teal))
              ])),
          SizedBox(width: 200, child: Image.asset('assets/intro.png')),
          Text(
            'Calcula de forma rápida el coste para crear tu app,'
            ' contestando estas sencillas preguntas.',
            textAlign: TextAlign.center,
          ),
          RaisedGradientButton(
            child: Text(
              'Cotiza mi App!',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () => controller.nextPage(
              duration: Duration(milliseconds: 1200),
              curve: Curves.easeOutExpo,
            ),
            gradient: LinearGradient(colors: [Colors.teal, Colors.indigo]),
          )
        ],
      ),
    ));
  }
}

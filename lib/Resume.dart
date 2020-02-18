import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotemyapp/Widgets/RisedGradientButton.dart';

class Resume extends StatelessWidget {
  List<Widget> widgets;
  double price;
  double time;
  List<String> schema;

  Resume(List<Widget> widgets, double prince, time, schema) {
    this.widgets = widgets;
    this.price = prince;
    this.time = time;
    this.schema = schema;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 120,
                height: 30,
                alignment: Alignment(0.0, 0.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.white, width: 1)),
                child: Text(schema[0]),
              ),
              Container(
                width: 120,
                height: 30,
                alignment: Alignment(0.0, 0.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.white, width: 1)),
                child: Text(schema[1]),
              )
            ],
          ),
          Wrap(
            children: widgets
                .map((widget) => Container(
                    margin: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                    height: 45,
                    width: 45,
                    decoration: (widget as Container).decoration,
                    child: (widget as Container).child))
                .toList(),
          ),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(style: TextStyle(fontSize: 30), children: [
                TextSpan(text: '¿Te gusto?'),
              ])),
          Text(
            price.toString() + ' \$',
            style: TextStyle(fontSize: 40),
          ),
          Text(
            'Este es el precio aproximado de crear tu App.\n' +
                'y tardaremos de ' +
                (time * .8).round().toString() +
                ' a ' +
                (time * 1.2).round().toString() +
                ' meses',
            textAlign: TextAlign.center,
          ),
          Text(
            'Nostros podemos ayudarte!',
            textAlign: TextAlign.center,
          ),
          RaisedGradientButton(
            child: Text(
              'Hagamos tu App!',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () => {},
            gradient: LinearGradient(colors: [Colors.teal, Colors.indigo]),
          )
        ],
      ),
    ));
  }
}

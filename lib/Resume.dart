import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotemyapp/Widgets/RisedGradientButton.dart';

class Resume extends StatelessWidget {
  List<Widget> widgets;
  double price;

  Resume(List<Widget> widgets, double prince) {
    this.widgets = widgets;
    this.price = prince;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Wrap(
            children: widgets.map((widget) =>
                Container(
                    margin: EdgeInsets.symmetric(vertical:4, horizontal: 6 ),
                    height: 45,
                    width: 45,
                    decoration: (widget as Container).decoration,
                    child: (widget as Container).child)

            ).toList(),
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
            'Este es el precio aproximado de crear tu App.\nNostros podemos ayudarte!',
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

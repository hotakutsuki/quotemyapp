import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Widgets/RisedGradientButton.dart';

class Schema extends StatefulWidget {
  Function addSchema;
  PageController controller;
  List<String> selected;

  Schema(addSchema, controller, selected) {
    this.addSchema = addSchema;
    this.controller = controller;
    this.selected = selected;
  }

  @override
  _SchemaState createState() => _SchemaState(addSchema, controller, selected);
}

class _SchemaState extends State<Schema> {
  Function addSchema;
  PageController controller;
  List<String> selected = List();

  _SchemaState(addSchema, controller, selected) {
    this.addSchema = addSchema;
    this.controller = controller;
    this.selected = selected;
  }

  handleInput(String selection) {
    setState(() {
      if (selected.contains(selection)) {
        selected.remove(selection);
        print(selected);
      } else if (selected.length < 2) {
        selected.add(selection);
      }
    });
    addSchema(selected);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            '¿Que quieres en tu App?',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            '(Solo puedes ecoger 2)',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
        ),
        Column(children: <Widget>[
          selectionButton('Calidad'),
          selectionButton('Buen Precio'),
          selectionButton('La Quiero Ya!')
        ]),
        SizedBox(
          width: 200,
          child: RaisedGradientButton(
            child: Text(
              'Continuar',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () => handleContinue(),
            gradient: LinearGradient(colors: [Colors.teal, Colors.indigo]),
          ),
        ),
      ],
    );
  }

  Widget selectionButton(String type) {
    return Container(
        width: 150,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(100),
          gradient: selected.contains(type)
              ? LinearGradient(colors: [
            Colors.teal,
            Color.lerp(Colors.teal, Colors.white, 0.3)
          ])
              : LinearGradient(
              colors: [Colors.transparent, Colors.transparent]),
        ),
        child: FlatButton(
          onPressed: () => handleInput(type),
          child: Text(
            type,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ));
  }

  handleContinue() {
    print(addSchema);
    controller.nextPage(
      duration: Duration(milliseconds: 750),
      curve: Curves.easeOutExpo,);
  }
}

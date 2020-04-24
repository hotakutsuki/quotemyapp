import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotemyapp/Widgets/RisedGradientButton.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class Resume extends StatelessWidget {
  List<Widget> widgets;
  double price;
  double time;
  List<String> schema;
  List<String> historyRequests;

  Resume(List<Widget> widgets, double prince, time, schema, historyRequests) {
    this.widgets = widgets;
    this.price = prince;
    this.time = time;
    this.schema = schema;
    this.historyRequests = historyRequests;
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
                TextSpan(text: '¿Te gustó?'),
              ])),
          Text(
            price.toStringAsFixed(0) + ' USD',
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
            onPressed: send,
            gradient: LinearGradient(colors: [Colors.teal, Colors.indigo]),
          )
        ],
      ),
    ));
  }

  Future<void> send() async {
    String requestsString = '';
    String searched = schema[0] + ' y ' + schema[1];
    historyRequests.map((request) => requestsString += request + ", ").toList();

    String body = 'Hola!\n' +
    'Tengo una idea genial para una Aplicación! y me gustaria trabajar con ustedes.\n' +
    'Estoy buscando ' + searched + '.\n' +
    'y tengo estos requerimientos: \n' +
    requestsString;
    print(body);
    
    final Email email = Email(
      body: body,
      subject: 'Hagamos esta app!',
      recipients: ['jotakutsuki@gmail.com'],
//      cc: ['cc@example.com'],
//      bcc: ['bcc@example.com'],
//      attachmentPath: '/path/to/attachment.zip',
      isHTML: false,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
//      platformResponse = 'success';
    } catch (error) {
//      platformResponse = error.toString();
    }

//    if (!mounted) return;
//
//    _scaffoldKey.currentState.showSnackBar(SnackBar(
//      content: Text(platformResponse),
//    ));
  }
}

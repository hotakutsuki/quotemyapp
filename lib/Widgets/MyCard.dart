import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String text;
  final AssetImage image;
  final Function action;

  const MyCard({
    Key key,
    this.text,
    this.image,
    @required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: InkWell(
        onDoubleTap: () => print('doublw'),
        onTap: () => action(text),
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Container(
          width: 220,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.teal, Colors.indigo]),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, offset: Offset(6, 6), blurRadius: 5),
                BoxShadow(
                    color: Colors.white12,
                    offset: Offset(-4, -4),
                    blurRadius: 3),
              ]),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Image(
                  image: image,
                  width: 50,
                  height: 50,
                ),
              ),
              Expanded(child: Text(text, textAlign: TextAlign.center,)),
              SizedBox(width: 16,)
            ],
          ),
        ),
      ),
    );
  }
}

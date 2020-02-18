import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String text;
  final AssetImage image;
  final Color color;
  final Function action;

  const MyCard({
    Key key,
    this.text,
    this.image,
    this.color,
    @required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: FlatButton(
        onPressed: () => action(
          text,
          image,
          color,
        ),
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Container(
          width: 220,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [color, Color.lerp(color, Colors.black, 0.3)]),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, offset: Offset(6, 6), blurRadius: 5),
                BoxShadow(
                    color: Colors.white24,
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
              Expanded(
                  child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              )),
              SizedBox(
                width: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}

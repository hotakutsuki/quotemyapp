import 'package:flutter/material.dart';

class CountAnimation extends StatefulWidget {
  final double price;

  CountAnimation({this.price});

  @override
  _CountAnimationState createState() => _CountAnimationState();
}

class _CountAnimationState extends State<CountAnimation>
    with SingleTickerProviderStateMixin {
  @override
  double oldValue;
  double newValue;
  Color color;

  void didUpdateWidget(CountAnimation oldWidget) {
    if (oldWidget.price == widget.price) {
      return;
    }

    oldValue = oldWidget.price;
    newValue = widget.price;

    _controller.reset();
    animation = Tween<double>(
            begin: oldValue == null ? 0 : oldValue,
            end: newValue == null ? 0 : newValue)
        .animate(_controller)
          ..addListener(() {
            setState(() {
              i = animation.value.toStringAsFixed(0);
//              color = Colors.white.withOpacity((newValue - animation.value + oldValue)/newValue * .2 );
            });
          });
    _controller.forward();

    super.didUpdateWidget(oldWidget);
  }

  Animation<double> animation;
  AnimationController _controller;
  String i='0';

  @override
  void initState() {
    _controller = AnimationController(
        duration: Duration(milliseconds: 750), vsync: this);
    color = Colors.transparent;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: color,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        child: Text(
          '$i \$',
          textDirection: TextDirection.rtl,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
        ),
      ),
    );
  }
}

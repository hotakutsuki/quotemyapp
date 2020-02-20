import 'package:flutter/material.dart';
import 'package:quotemyapp/PageHome.dart';
import 'package:quotemyapp/PageQuality.dart';

import 'Resume.dart';
import 'Schema.dart';
import 'Widgets/CountAnimation.dart';
import 'Widgets/CustomScrollPhysics.dart';

class MyPageView extends StatefulWidget {
  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {

  PageController controller = PageController();
  var page = 0;
  String bottomPageInfo;
  double price = 0;
  double time = 0;
  List<Widget> listWidget = new List();
  List<Widget> listAnimatedWigets = new List();
  List<int> historyCodes = new List();
  List<String> historyRequests = new List();
  bool isAnimating=false;
  List<String> schema = List();

  @override
  void initState() {
    bottomPageInfo = ' ';
    super.initState();
  }

  goingBack() {
    return controller.previousPage(
      duration: Duration(milliseconds: 750),
      curve: Curves.easeOutCirc,
    );
  }

  Future<bool> _onBackPressed() {
    if (page==0){
      return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text('Saliendo'),
          content: new Text('Estas seguro que quieres salir?'),
          actions: <Widget>[
            new FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: new Text('No'),
            ),
            new FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: new Text('Si'),
            ),
          ],
        ),
      ) ??
          false;
    } else {
      goingBack();
    }
  }

  Future controlAnimation() async {
    setState(() {
      isAnimating = true;
    });
    await pause(const Duration(milliseconds: 750));//  pause the program for given duration
    setState(() {
      isAnimating = false;
    });
  }
  Future pause(Duration d) => new Future.delayed(d);

  addAnswer(text, image, color, value) {
    if (isAnimating) return;
    controller.nextPage(
      duration: Duration(milliseconds: 750),
      curve: Curves.easeOutCirc,
    );
    controlAnimation();
    setState(() {
      historyCodes.add(value);
      historyRequests.add(text);
      listWidget.add(Container(
          margin: EdgeInsets.symmetric(vertical:4, horizontal: 3 ),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, offset: Offset(6, 6), blurRadius: 5),
                BoxShadow(
                    color: Colors.white24,
                    offset: Offset(-4, -4),
                    blurRadius: 3),
              ] ,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 1),
            color: color,
            image:  DecorationImage(image: image),
          ),));
    });
  }
  addSchema(List<String> schemas){
    this.schema=schemas;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Colors.white30,
        body: Column(
          children: <Widget>[
            upperInfo(),
            Expanded(
              child: PageView(
                physics: isAnimating? NeverScrollableScrollPhysics() : CustomScrollPhysics(),
                controller: controller,
                onPageChanged: ((page) => updateNumer(page)),
                children: <Widget>[
                  HomePage(controller),
                  Schema(addSchema, controller, schema),
                  QualityPage(addAnswer, 'screens'),
                  QualityPage(addAnswer, 'os'),
                  QualityPage(addAnswer, 'design'),
                  QualityPage(addAnswer, 'monetization'),
                  QualityPage(addAnswer, 'login'),
                  QualityPage(addAnswer, 'web'),
                  QualityPage(addAnswer, 'users'),
                  QualityPage(addAnswer, 'admin'),
                  QualityPage(addAnswer, 'languaje'),
                  QualityPage(addAnswer, 'publication'),
                  Resume(listWidget, price, time, schema, historyRequests),
                ],
              ),
            ),
            historyDetail(),
            Container(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                bottomPageInfo,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget historyDetail() {
    if (historyCodes.length==10){
      return SizedBox(height: 50,);
    }

    listAnimatedWigets = listWidget
        .map((parentWidget) => AnimatedSwitcher(
              duration: Duration(milliseconds: 250),
              transitionBuilder: (widget, animation) => ScaleTransition(
                child: widget,
                scale: animation,
              ),
              child: parentWidget,
            ))
        .toList();
    listAnimatedWigets.add(AnimatedSwitcher(
        duration: Duration(seconds: 250),
        transitionBuilder: (widget, animation) => ScaleTransition(
          child: widget,
          scale: animation,
        ),
        child: SizedBox()));

    return SizedBox(
      width: 290,
      height: 50,
      child: Row(
        children: listAnimatedWigets,
      ),
    );
  }

  Widget upperInfo() {
    return Container(
        padding: EdgeInsets.only(top: 24),
        child: page < 2
            ? SizedBox(
                height: 48,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: FlatButton.icon(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Atrás',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => goingBack(),
                    ),
                  ),
//                  Container(
//                      margin: EdgeInsets.only(right: 40),
//                      child: historyCodes.length == 10? null : Text(
//                        price.toString() + ' \$',
//                        textAlign: TextAlign.end,
//                        style: TextStyle(fontSize: 18),
//                      )),
                  CountAnimation(price: price),
                ],
              ));
  }

  void updateNumer(page) {
    setState(() {
      if (this.page > page && historyCodes.length>0){
        historyCodes.removeLast();
        listWidget.removeLast();
        historyRequests.removeLast();
      }
      if (page > historyCodes.length+2 || (page>1 && schema.length!=2) ){
        controller.previousPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOutExpo,
        );
        return;
      }
      this.page = page;

      bottomPageInfo = (page == 0 || page == 1 || page == 12) ? '' : (page-1).toString() + "/10";

      double quylif = 0;
      historyCodes.map((value) => quylif += value).toList();

      if (schema.contains('Buen Precio')){
        price = quylif*100;
      }else{
        price = quylif*225;
      }

      if (schema.contains('La Quiero Ya!')){
        time = quylif*.25;
      }else{
        time = quylif*.8;
      }
    });
  }
}

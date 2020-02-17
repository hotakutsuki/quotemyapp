import 'package:flutter/material.dart';
import 'package:quotemyapp/PageHome.dart';
import 'package:quotemyapp/PageQuality.dart';

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
  List<Widget> listWidget = new List();
  List<Widget> listAnimatedWigets = new List();
  List<String> historyCodes = new List();

  @override
  void initState() {
    bottomPageInfo = ' ';
    super.initState();
  }

  goingBack() {
    controller.previousPage(
      duration: Duration(milliseconds: 800),
      curve: Curves.easeOutExpo,
    );
  }

  addAnswer(text, image, color) {
    setState(() {
      historyCodes.add(text);
      listWidget.add(Container(
          margin: EdgeInsets.symmetric(vertical:4, horizontal: 6 ),
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, offset: Offset(6, 6), blurRadius: 5),
                BoxShadow(
                    color: Colors.white12,
                    offset: Offset(-4, -4),
                    blurRadius: 3),
              ] ,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 1),
            color: color,
          ),
          child: Image(image: image,)));
    });
    controller.nextPage(
      duration: Duration(milliseconds: 850),
      curve: Curves.easeOutExpo,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      body: Column(
        children: <Widget>[
          upperInfo(),
          Expanded(
            child: PageView(
              physics: CustomScrollPhysics(),
              controller: controller,
              onPageChanged: ((page) => updateNumer(page)),
              children: <Widget>[
                HomePage(controller),
                QualityPage(addAnswer, 'quality'),
                QualityPage(addAnswer, 'os'),
                QualityPage(addAnswer, 'design'),
                QualityPage(addAnswer, 'monetization'),
                QualityPage(addAnswer, 'login'),
                QualityPage(addAnswer, 'web'),
                QualityPage(addAnswer, 'users'),
                QualityPage(addAnswer, 'admin'),
                QualityPage(addAnswer, 'languaje'),
                QualityPage(addAnswer, 'state'),
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
    );
  }

  Widget historyDetail() {
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
                  Container(
                      margin: EdgeInsets.only(right: 40),
                      child: Text(
                        price.toString() + ' \$',
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 18),
                      ))
                ],
              ));
  }

  void updateNumer(page) {
    setState(() {
      if (this.page > page && historyCodes.length>0){
        historyCodes.removeLast();
        listWidget.removeLast();
      }
      if (page > historyCodes.length+1){
        controller.previousPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOutExpo,
        );
        return;
      }
      this.page = page;

      bottomPageInfo = page == 0 ? '' : page.toString() + "/10";
      double price = 0;
      historyCodes.map((code) => price += 100).toList();
      this.price = price;
    });
  }
}

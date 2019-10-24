import 'package:flutter/material.dart';

class ANumbersWidgetDefine {
  static Future<void> neverSatisfied(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rewind and remember'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You are neverbe satisfied.'),
                Text("You're like me. i'm never be satisfied"),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Regret'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  static Widget Aligns() {
    return Container(
      height: 120.0,
      width: 120.0,
      color: Colors.blue[50],
      child: Align(
        alignment: Alignment.bottomCenter,
        child: FlutterLogo(
          size: 60,
        ),
      ),
    );
  }

//  static Widget AnimalAligns() {
//    return Column(
//      mainAxisSize: MainAxisSize.min,
//      children: <Widget>[
//        Container(
//          width: 120,
//          height: 120,
//          color: Colors.blue[50],
//          child: AnimatedAlign(alignment: _alignment, duration: Duration(seconds: 3),
//          child: ,),
//        )
//      ],
//    );
//  }
}

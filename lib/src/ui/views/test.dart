import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class TestView extends StatelessWidget {
  const TestView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child:  RaisedButton(
                onPressed: () {
                  showSimpleNotification(
                      Text("this is a message from simple notification"),
                      background: Colors.green);
                },
                child: Text("Auto Dimiss Notification"),
              ),
        ),
      ),
    );
  }
}

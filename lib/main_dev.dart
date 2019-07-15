import 'package:flutter/material.dart';
import 'package:get_closr/src/core/app_constants.dart';
import 'package:get_closr/src/ui/shared/theme.dart';
import 'package:get_closr/src/utils/router.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:logger/logger.dart';

void main() => runApp(ClosrApp());

var logger = Logger(
  printer: PrettyPrinter(),
);

var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

class ClosrApp extends StatelessWidget {
//   @override
//   _ClosrAppState createState() => _ClosrAppState();
// }

// class _ClosrAppState extends State<ClosrApp> {
  // void log() {
  //   logger.d("Log message with 2 methods");
  //   loggerNoStack.i("Info message");
  //   loggerNoStack.w("Just a warning!");
  //   logger.e("Error! Something bad happend", "Test Error");
  //   loggerNoStack.v({"key": 5, "value": "something"});
  //   Future.delayed(Duration(seconds: 5), log);
  // }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        title: 'Closr App',
        theme: buildClosrTheme(1),
        onGenerateRoute: Router.generateRoute,
        initialRoute: loginRoute,
      ),
    );
  }
}

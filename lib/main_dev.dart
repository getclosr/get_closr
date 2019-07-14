import 'package:flutter/material.dart';
import 'package:get_closr/src/core/app_constants.dart';
import 'package:get_closr/src/ui/shared/theme.dart';
import 'package:get_closr/src/utils/router.dart';
import 'package:overlay_support/overlay_support.dart';

void main() => runApp(ClosrApp());

class ClosrApp extends StatefulWidget {
  @override
  _ClosrAppState createState() => _ClosrAppState();
}

class _ClosrAppState extends State<ClosrApp> {
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

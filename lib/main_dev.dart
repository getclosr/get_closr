import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_closr/src/core/app_constants.dart';
// import 'package:get_closr/src/ui/shared/theme.dart';
import 'package:get_closr/src/utils/router.dart';
import 'package:overlay_support/overlay_support.dart';


void main() => runApp(ClosrApp());


class ClosrApp extends StatelessWidget {
//   @override
//   _ClosrAppState createState() => _ClosrAppState();
// }



  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.grey[200],
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.black
    ));

    return OverlaySupport(
      child: MaterialApp(
        title: 'Closr App',
        // theme: buildClosrTheme(1),
        onGenerateRoute: Router.generateRoute,
        initialRoute: loginRoute,
      ),
    );
  }
}

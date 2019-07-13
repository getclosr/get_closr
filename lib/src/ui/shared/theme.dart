import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData buildClosrTheme(theme) {
  final ThemeData base = theme == 1 ? ThemeData.light() : ThemeData.dark();

  final accentColorHolder =
      base.brightness == Brightness.dark ? kClosrAltDarkGrey : kClosrPink100;
  final primaryColorHolder =
      base.brightness == Brightness.dark ? kClosrAltDarkGrey : kClosrPink100;
  final buttonColorHolder =
      base.brightness == Brightness.dark ? kClosrAltYellow : kClosrPink100;
  final scaffoldBackgroundColorHolder = base.brightness == Brightness.dark
      ? kClosrAltDarkGrey
      : kClosrBackgroundWhite;
  final iconColorHolder =
      base.brightness == Brightness.dark ? kClosrAltYellow : kClosrBrown900;

  return base.copyWith(
    //Main colors
    accentColor: accentColorHolder,
    primaryColor: primaryColorHolder,
    buttonColor: buttonColorHolder,
    scaffoldBackgroundColor: scaffoldBackgroundColorHolder,
    cardColor: kClosrBackgroundWhite,

    //Error
    errorColor: kClosrErrorRed,

    //Text Theme
    textSelectionColor: theme == 1 ? kClosrPink100 : kClosrAltYellow,
    textSelectionHandleColor: kClosrPink100,
    textTheme: buildClosrTextTheme(base.textTheme, theme),
    primaryTextTheme: buildClosrTextTheme(base.primaryTextTheme, theme),
    accentTextTheme: buildClosrTextTheme(base.accentTextTheme, theme),
    hintColor: kClosrGrey,

    //Icon Theme
    primaryIconTheme: base.iconTheme.copyWith(color: iconColorHolder),
  );
}

TextTheme buildClosrTextTheme(TextTheme base, theme) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
        ),
        title: base.title.copyWith(fontSize: 20.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
      )
      .apply(
          fontFamily: 'Rubik',
          displayColor: theme == 1 ? kClosrBrown900 : kClosrSurfaceWhite,
          bodyColor: theme == 1 ? kClosrBrown900 : kClosrSurfaceWhite);
}

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);
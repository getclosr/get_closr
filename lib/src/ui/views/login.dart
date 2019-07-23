import 'package:flutter/material.dart';
import 'package:get_closr/src/core/app_constants.dart';
import 'package:get_closr/src/core/enums/form_mode.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get_closr/src/ui/shared/app_colors.dart' as prefix0;
import 'package:get_closr/src/ui/shared/screensize_reducers.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _passw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: PreferredSize(
        child: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false,
        ),
        preferredSize: Size.fromHeight(0),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                    height: screenHeightExcludingToolbar(context, dividedBy: 3),
                    child: Image.asset(
                      'assets/images/Closr_logo.png',
                    )),
              ),
              SignInButtonBuilder(
                icon: Icons.email,
                onPressed: () {
                  Navigator.pushNamed(context, testRoute);
                },
                backgroundColor: Theme.of(context).buttonColor,
                text: 'Sign in with email',
                textColor: prefix0.kClosrBrown900,
              ),
              SignInButton(
                Buttons.Google,
                mini: true,
                onPressed: () {
                  Navigator.pushNamed(context, homeRoute, arguments: 'Alex');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showPrimaryButton(context) {
    return RaisedButton(
      child: Text('Login'),
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: Theme.of(context).buttonColor,
      onPressed: () async {},
    );
  }

  Widget googleLoginButton(context) {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      icon: Icon(FontAwesomeIcons.google, color: Colors.white),
      label: Text(
        'Sign in with Google',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      elevation: 2.0,
      color: Colors.redAccent,
      onPressed: () async {
        var loginSuccess = true;
        if (loginSuccess) {
          Navigator.pushNamed(context, '/');
        }
      },
    );
  }

  switchButton(model) {
    return FlatButton(
        child: model.mode == FormMode.Login
            ? Text('Create an account')
            : Text('Have an account? Sign in'),
        onPressed: () async {
          model.switchMode(model.mode);
        });
  }
}

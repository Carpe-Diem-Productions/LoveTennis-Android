import 'package:flutter/material.dart';
import 'login_register_page.dart';
import 'authentication.dart';
import 'home_page.dart';

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN
}

class SplashScreen extends StatefulWidget {
  final BaseAuth auth = Auth();

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var _authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = "";

  @override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _userId = user?.uid;
        }
        _authStatus = (user?.uid == null) ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    switch (_authStatus) {
      case AuthStatus.LOGGED_IN:
        return HomePage(_userId, logoutCallback);
      case AuthStatus.NOT_LOGGED_IN:
      default:
        return LoginRegisterPage(
          auth: widget.auth,
          loginCallback: loginCallback,
        );
    }
  }

  void loginCallback() {
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        _userId = user.uid.toString();
      });
    });
    setState(() {
      _authStatus = AuthStatus.LOGGED_IN;
    });
  }

  void logoutCallback() {
    setState(() {
      _authStatus = AuthStatus.NOT_LOGGED_IN;
      _userId = "";
    });
  }
}
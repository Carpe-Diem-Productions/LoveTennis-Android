import 'package:flutter/material.dart';
import 'authentication.dart';

class LoginRegisterPage extends StatelessWidget {
  LoginRegisterPage({this.auth, this.loginCallback});

  final BaseAuth auth;
  final VoidCallback loginCallback;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: UsernamePasswordForm(auth, loginCallback),
    );
  }
}

class UsernamePasswordForm extends StatefulWidget {
  UsernamePasswordForm(this.auth, this.loginCallback);

  final BaseAuth auth;
  final VoidCallback loginCallback;

  @override
  UsernamePasswordState createState() => UsernamePasswordState();
}

class UsernamePasswordState extends State<UsernamePasswordForm> {
  final _formKey = new GlobalKey<FormState>();
  String _email;
  String _user;
  String _password;
  String _errorMessage;
  var _isLoading;

  void _doRegister() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    String userId = "";
    try {
      userId = await widget.auth.signUp(_email, _password);
      //widget.auth.sendEmailVerification();
      //_showVerifyEmailSentDialog();
      print('Signed up user: $userId');
      setState(() {
        _isLoading = false;
      });

      if (userId.length > 0 && userId != null) {
        widget.loginCallback();
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        _isLoading = false;
        _formKey.currentState.reset();
      });
    }
  }

  void _doLogin() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    String userId = "";
    try {
        userId = await widget.auth.signIn(_email, _password);
        print('Signed in: $userId');

        setState(() {
          _isLoading = false;
        });

      if (userId.length > 0 && userId != null) {
        widget.loginCallback();
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        _isLoading = false;
//        _errorMessage = e.message;
        _formKey.currentState.reset();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image(
              image: AssetImage("assets/images/love_tennis_logo_design.png")
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter email or username.';
                }
                return null;
              },
              onSaved: (value) {
                _email = value.trim();
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
              obscureText: true,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter password, or click on "Reset Password".';
                }
                return null;
              },
              onSaved: (value) {
                _password = value.trim();
              },
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    _doRegister();
                  }
                },
                child: Text('Register'),
              ),
              RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    _doLogin();
                  }
                },
                color: Color(0xFF42A5F5),
                child: Text('Login'),
              ),
              FlatButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState.validate()) {
                    _doRegister();
                  }
                },
                child: Text('Reset Password'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


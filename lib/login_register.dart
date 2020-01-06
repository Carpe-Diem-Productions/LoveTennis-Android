import 'package:flutter/material.dart';

//class LoginRegister extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Welcome"),
//      ),
//      body: UsernamePasswordForm(),
//    );
//  }
//}

class UsernamePasswordForm extends StatefulWidget {
  @override
  UsernamePasswordState createState() => UsernamePasswordState();
}

class UsernamePasswordState extends State<UsernamePasswordForm> {
  final _formKey = new GlobalKey<FormState>();
  String _user;
  String _password;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Email / Username',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter email or username.';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // TODO: Log in via Firebase.
                }
              },
              child: Text('Login'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // TODO: Log in via Firebase.
                }
              },
              child: Text('Register'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // TODO: Log in via Firebase.
                }
              },
              child: Text('Forgot Password'),
            ),
          ),
        ],
      ),
    );
  }
}


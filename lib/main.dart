
import 'package:flutter/material.dart';
import 'login_register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to LoveTennis',
//      theme: ThemeData(
//        brightness: Brightness.dark,
//      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome'),
        ),
        body: UsernamePasswordForm(),
      ),
    );
  }
}

//class SplashScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Startup Name Generator'),
//        actions: <Widget>[
//          IconButton(icon: Icon(Icons.list)),
//        ],
//      ),
//      body: null,
//    );
//  }
//
//  void _pushLogin() {
//    Navigator.of(context).push(
//      MaterialPageRoute<void>(
//        builder: (BuildContext context) {
//          return Scaffold(
//            appBar: AppBar(
//              title: Text('Saved Suggestions'),
//            ),
//            body: null,
//          );
//        },
//      ),
//    );
//  }
//  }
//
//  void _pushAfterLogin() {
//    Navigator.of(context).push(
//      MaterialPageRoute<void>(
//        builder: (BuildContext context) {
//          return Scaffold(
//              appBar: AppBar(
//                title: Text('Saved Suggestions'),
//              ),
//              body: null,
//          );
//        },
//      ),
//    );
//  }
//}

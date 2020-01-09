import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage(this.userId, this.logoutCallback);

  final userId;
  final VoidCallback logoutCallback;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            tooltip: "Logout",
            onPressed: logoutCallback,
          )
        ],
      ),
      body: Text("Hello world"),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: 0,
      ),
    );
  }
}
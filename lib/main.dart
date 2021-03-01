import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget mainWidget = Item1();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NavBar Tutorial',
      home: Scaffold(
        appBar: AppBar(
          title: Text('NavBar Tutorial'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // What happens after you tap the navigation item
                  setState(() {
                    mainWidget = Item1();
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // What happens after you tap the navigation item
                  setState(() {
                    mainWidget = Item2();
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: mainWidget, // Here
      ),
    );
  }
}

class Item1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Item 1'),
    );
  }
}

class Item2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Item 2'),
    );
  }
}

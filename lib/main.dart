// ignore: avoid_web_libraries_in_flutter
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
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
      title: 'BruxAlert',

      home: Scaffold(
        appBar: AppBar(
          title: Text('BruxAlert'),
          backgroundColor: Colors.purple[400],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              ListTile(
                title: Text(''),

                onTap: () {
                  // What happens after you tap the navigation item
                  setState(() {

                    mainWidget = Item1();
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(

                title: Text('Heartrate'),
                tileColor: Colors.blue,
                onTap: () {
                  // What happens after you tap the navigation item
                  setState(() {
                    mainWidget = Item1();
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Pressure Sensor'),
                tileColor: Colors.green,
                onTap: () {
                  // What happens after you tap the navigation item
                  setState(() {
                    mainWidget = Item1();
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Motor Information'),
                tileColor: Colors.yellow,
                onTap: () {
                  // What happens after you tap the navigation item
                  setState(() {
                    mainWidget = Item1();
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Temperature'),
                tileColor: Colors.red,
                onTap: () {
                  // What happens after you tap the navigation item
                  setState(() {
                    mainWidget = Item1();
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Progress'),
                tileColor: Colors.pink,
                onTap: () {
                  // What happens after you tap the navigation item
                  setState(() {
                    mainWidget = Item1();
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Settings'),
                tileColor: Colors.grey,
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
      appBar: AppBar(
        title: Text('Hey, how are you doing today?'),
        backgroundColor: Colors.lightBlue[400],
        centerTitle: true,

      ),
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

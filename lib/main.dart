// ignore: avoid_web_libraries_in_flutter
// import 'dart:html';

//import 'dart:html';

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

  //Widget hrButton = HRButton();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BruxAlert',
      home: Scaffold(
        appBar: AppBar(
          title: Text('BruxAlert'),
          backgroundColor: Colors.grey,
        ),
        drawer: Drawer(
          // Menu bar
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
                tileColor: Colors.pink[300],
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
                tileColor: Colors.lightGreen[300],
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
                tileColor: Colors.yellow[300],
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
                tileColor: Colors.lightBlue[300],
                onTap: () {
                  // What happens after you tap the navigation item
                  setState(() {
                    mainWidget = Item1();
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Overall Progress'),
                tileColor: Colors.indigo[300],
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

        body: (// mainWidget), // Here
                TextButton.icon(
                    label: Text('Heart Rate'),
                    icon: Icon(Icons.workspaces_filled),
                    onPressed: () {
                      print('Pressed');
                    }
                )
      //       TextButton.icon(
      //       label: Text('Pressure Sensor'),
      //     icon: Icon(Icons.workspaces_filled),
      //     onPressed: () {
      //       print('Pressed');
      //     }
      // ),
      //   TextButton.icon(
      //       label: Text('Motor Information'),
      //       icon: Icon(Icons.workspaces_filled),
      //       onPressed: () {
      //         print('Pressed');
      //       }
      //   ),
      //   TextButton.icon(
      //       label: Text('Temperature'),
      //       icon: Icon(Icons.workspaces_filled),
      //       onPressed: () {
      //         print('Pressed');
      //       }
      //   ),
      //   TextButton.icon(
      //       label: Text('Overall Progress'),
      //       icon: Icon(Icons.workspaces_filled),
      //       onPressed: () {
      //         print('Pressed');
      //       }
      //   ) // end of text buttons
            )

      ),

      );
  }
}

class Item1 extends StatelessWidget {
  // Item 1 is for the welcome message
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

// ignore: avoid_web_libraries_in_flutter
// import 'dart:html';

//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Brux Alert'),
    );
  }
  //_MyAppState createState() => _MyAppState();
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyAppState createState() => new _MyAppState();
}


class _MyAppState extends State<MyHomePage> {
  Widget mainWidget = Item1();

  buttonPressed(String buttonText){
    print(buttonText); // DEBUG purposes
  }


  Widget buildButton(String buttonText){
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(12.0),
        child: new Text(
          buttonText,
          style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }
  String output = "";


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(title: new Text(widget.title)),
        backgroundColor: Color(0xf1d1d6),
          drawer: Drawer(
            // Menu bar
            child:
            ListView(
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
                  title: Text('Heart rate'),
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

          body: new Container(
            child: new Column(
              children: [
                new Row(children: [
                    buildButton("Profile"),
                    buildButton("Notifications")
                ]),
                new Container(
                alignment: Alignment.centerRight,
                padding:
                new EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
                child: new Text(output,
                    style: new TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                    ))),
              new Expanded(
                child: new Divider(),
              ),
              new Column(children: [
                new Row(children: [
                  buildButton("Heart Rate"),
                  buildButton("Temperature"),
                  buildButton("Home"),
                  buildButton("Pressure"),
                  buildButton("Reports")
                ]),
              ],
            )
          // mainWidget), // Here
        ])
      )
    )


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

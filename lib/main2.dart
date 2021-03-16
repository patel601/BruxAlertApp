import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    title: 'Page Route Navigation',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brux Alert Home'),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Temperature'),
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue[300]) ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Temperature"),
        backgroundColor: Colors.lightBlue[300],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Home'),
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen) ),
        ),
      ),
    );
  }
}

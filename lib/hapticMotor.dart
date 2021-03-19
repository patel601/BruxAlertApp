import 'package:flutter/material.dart';
import 'constants.dart';
import 'main.dart';
class HMotorScreen extends StatelessWidget {
  const HMotorScreen({Key  key}) : super(key: key);

  static const String _title = 'Haptic Motor';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Haptic Motor'),
        backgroundColor: Colors.teal,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.bluetooth),
            tooltip: 'Show connection',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Connected to device!')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.bluetooth_audio),

            color: Colors.purple,

              tooltip: 'Toggle Bluetooth'
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Go to connectivity',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Connectivity'),
                    ),
                    body: const Center(
                      child: Text(
                        'Some Information about connectivity will be displayed here',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  );
                },
              ));
            },
          ),
        ],
      ),
      body: const Center(
        widthFactor: 10,
        heightFactor: 20,
        child: Text(
          'Haptic Motor screen setup',
          style: TextStyle(fontSize: 24, color: Colors.teal,),
        ),
      ),

    );
  }
}

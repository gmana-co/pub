import 'package:flutter/material.dart';
import 'package:gmana/gmana.dart';

class MyHomePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Throttle _throttler = Throttle(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Throttle Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _throttler.run(_onButtonPressed);
          },
          child: Text('Press me'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _throttler.dispose();
    super.dispose();
  }

  void _onButtonPressed() {
    print("Button pressed!");
  }
}

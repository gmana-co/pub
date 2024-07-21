import 'package:flutter/material.dart';
import 'package:gmana/gmana.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Debounce Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  final Debounce _debounce = Debounce(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Debounce Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Search',
              ),
              onChanged: (value) {
                _debounce.run(_onSearchChanged);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _debounce.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    print("Search query: ${_controller.text}");
  }
}

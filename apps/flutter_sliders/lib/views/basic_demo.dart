import 'package:flutter/material.dart';
import 'package:gmana_slider/gmana_slider.dart';

class BasicDemo extends StatelessWidget {
  const BasicDemo({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5];
    return Scaffold(
      appBar: AppBar(title: const Text('Basic demo')),
      body: GManaSlider(
        options: CarouselOptions(),
        items: list
            .map(
              (item) => Container(
                color: Colors.green,
                child: Center(
                  child: Text(
                    item.toString(),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

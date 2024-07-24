import 'package:flutter/material.dart';
import 'package:flutter_sliders/utils/image_list.dart';
import 'package:gmana_slider/gmana_slider.dart';

class FullScreenSliderDemo extends StatelessWidget {
  const FullScreenSliderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Full screen sliding carousel demo')),
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return GManaSlider(
            options: CarouselOptions(
              height: height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              // autoPlay: false,
            ),
            items: imageList
                .map(
                  (item) => Center(
                    child: Image.network(
                      item,
                      fit: BoxFit.cover,
                      height: height,
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}

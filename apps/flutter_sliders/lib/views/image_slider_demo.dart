import 'package:flutter/material.dart';
import 'package:flutter_sliders/utils/image_list.dart';
import 'package:gmana_slider/gmana_slider.dart';

class ImageSliderDemo extends StatelessWidget {
  const ImageSliderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image slider demo')),
      body: GManaSlider(
        options: CarouselOptions(),
        items: imageList.map((item) => Center(child: Image.network(item, fit: BoxFit.cover, width: 1000))).toList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_sliders/main.dart';
import 'package:flutter_sliders/views/demo_item.dart';

class CarouselDemoHome extends StatelessWidget {
  const CarouselDemoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carousel demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.nightlight_round),
            onPressed: () {
              themeMode.value = themeMode.value == 1 ? 2 : 1;
            },
          )
        ],
      ),
      body: ListView(
        children: const <Widget>[
          DemoItem('Basic demo', '/basic'),
          DemoItem('No center mode demo', '/no-center'),
          DemoItem('Image carousel slider', '/image'),
          DemoItem('More complicated image slider', '/complicated'),
          DemoItem('Enlarge strategy demo slider', '/enlarge'),
          DemoItem('Manually controlled slider', '/manual'),
          DemoItem('Noon-looping carousel slider', '/no-loop'),
          DemoItem('Vertical carousel slider', '/vertical'),
          DemoItem('Full screen carousel slider', '/full-screen'),
          DemoItem('Carousel with indicator controller demo', '/indicator'),
          DemoItem('On-demand carousel slider', '/on-demand'),
          DemoItem('Image carousel slider with prefetch demo', '/prefetch'),
          DemoItem('Carousel change reason demo', '/reason'),
          DemoItem('Keep page view position demo', '/position'),
          DemoItem('Multiple item in one screen demo', '/multiple'),
          DemoItem('Enlarge strategy: zoom demo', '/zoom'),
          DemoItem('more widgets', '/widgets'),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gmana_slider/gmana_slider.dart';

class WidgetsView extends StatefulWidget {
  const WidgetsView({super.key});

  @override
  State<WidgetsView> createState() => _WidgetsViewState();
}

class _WidgetsViewState extends State<WidgetsView> {
  final images = [
    "https://www.lexus.co.th/content/dam/lexus-v3-blueprint/discover-lexus/future-and-concept-cars/conceptcars-list-LFZ.jpg",
    "https://cdn.motor1.com/images/mgl/P3GjYL/s1/lexus-electrified-sedan-concept-rear-angle.jpg",
    "https://www.nissan-global.com/JP/INNOVATION/TECHNOLOGY/TOPICS/NISSAN_FUTURES/ASSETS/IMG/nissan_futures_02.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Image Carousel Example',
            ),

            // Do not show DOT and COUNT - No dot and no count
            const Text(
              'Empty Image - ',
            ),

            // Empty image list - return a empty sizeBox
            const BCBLImageCarousel(
              images: [],
              height: 200,
              boxColor: Colors.pinkAccent,
              positionTextStyle: TextStyle(color: Colors.white),
              boxFit: BoxFit.cover,
              autoPlay: true,
              dotColor: Colors.greenAccent,
              showCount: false,
              showDot: false,
              isOutOfStock: true,
              outOfStockText: "SOLD OUT",
              outOfStockTextStyle: TextStyle(color: Colors.white),
            ),

            // Do not show DOT and COUNT - No dot and no count
            const Text(
              'Do not show DOT and COUNT - No dot and no count',
            ),
            BCBLImageCarousel(
              images: images,
              boxColor: Colors.pinkAccent,
              positionTextStyle: const TextStyle(color: Colors.white),
              boxFit: BoxFit.fill,
              autoPlay: true,
              dotColor: Colors.greenAccent,
              showCount: false,
              showDot: false,
              isOutOfStock: true,
              outOfStockText: "SOLD OUT",
              outOfStockTextStyle: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 8,
            ),

            // Bottom Center dot and Bottom Left count
            const Text(
              'Bottom Center dot and Bottom Left count',
            ),
            BCBLImageCarousel(
              images: images,
              boxColor: Colors.white,
              positionTextStyle: const TextStyle(color: Colors.black),
              boxFit: BoxFit.fill,
              autoPlay: true,
              dotColor: Colors.white,
              dotType: DotType.rounded,
              isOutOfStock: true,
              outOfStockText: "SOLD OUT",
              outOfStockTextStyle: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 8,
            ),

            // Bottom Center dot and Bottom Right count
            const Text(
              'Bottom Center dot and Bottom Right count',
            ),
            BCBRImageCarousel(
              images: images,
              boxColor: Colors.white,
              positionTextStyle: const TextStyle(color: Colors.black),
              boxFit: BoxFit.fill,
              autoPlay: true,
              dotColor: Colors.white,
              showCount: true,
              showDot: true,
            ),
            const SizedBox(
              height: 8,
            ),

            // Bottom Center dot and Top Left count
            const Text(
              'Bottom Center dot and Top Left count',
            ),
            BCTLImageCarousel(
              images: images,
              height: 200,
              boxColor: Colors.white,
              positionTextStyle: const TextStyle(color: Colors.black),
              boxFit: BoxFit.fill,
              autoPlay: true,
              dotColor: Colors.white,
              dotType: DotType.rounded,
            ),
            const SizedBox(
              height: 8,
            ),

            // Bottom Center dot and Top Right count
            const Text(
              'Bottom Center dot and Top Right count',
            ),
            BCTRImageCarousel(
              images: images,
              height: 200,
              boxColor: Colors.white,
              positionTextStyle: const TextStyle(color: Colors.black),
              boxFit: BoxFit.fill,
              autoPlay: true,
              dotColor: Colors.white,
            ),
            const SizedBox(
              height: 8,
            ),

            // Top Center dot
            const Text(
              'Top Center dot',
            ),
            TCImageCarousel(
              images: images,
              height: 200,
              boxFit: BoxFit.fill,
              autoPlay: true,
              dotColor: Colors.white,
            ),
            const SizedBox(
              height: 8,
            ),

            // Top Left dot
            const Text(
              'Top Left dot',
            ),
            TLImageCarousel(
              images: images,
              height: 200,
              boxFit: BoxFit.fill,
              autoPlay: true,
              dotColor: Colors.white,
            ),
            const SizedBox(
              height: 8,
            ),

            // Top Right dot
            const Text(
              'Top Right dot',
            ),
            TRImageCarousel(
              images: images,
              height: 200,
              boxFit: BoxFit.fill,
              autoPlay: true,
              dotColor: Colors.white,
              dotType: DotType.rounded,
            ),
            const SizedBox(
              height: 8,
            ),

            // Bottom Left dot
            const Text(
              'Bottom Left dot',
            ),
            BLImageCarousel(
                images: images,
                height: 200,
                boxFit: BoxFit.fill,
                autoPlay: true,
                dotColor: Colors.white,
                dotType: DotType.rounded),
            const SizedBox(
              height: 8,
            ),

            // Bottom Right dot
            const Text(
              'Bottom Right dot',
            ),
            BRImageCarousel(
              images: images,
              boxFit: BoxFit.fill,
              autoPlay: true,
              dotColor: Colors.white,
              isOutOfStock: true,
              outOfStockText: "SOLD OUT",
              outOfStockTextStyle: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}

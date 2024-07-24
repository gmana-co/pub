import 'package:flutter/material.dart';
import 'package:flutter_sliders/carousel_demo_home.dart';
import 'package:flutter_sliders/views/basic_demo.dart';
import 'package:flutter_sliders/views/carousel_change_reason_demo.dart';
import 'package:flutter_sliders/views/carousel_with_indicator_demo.dart';
import 'package:flutter_sliders/views/complicated_image_demo.dart';
import 'package:flutter_sliders/views/enlarge_strategy_demo.dart';
import 'package:flutter_sliders/views/enlarge_strategy_zoom_demo.dart';
import 'package:flutter_sliders/views/full_screen_slider_demo.dart';
import 'package:flutter_sliders/views/image_slider_demo.dart';
import 'package:flutter_sliders/views/keep_page_view_position_demo.dart';
import 'package:flutter_sliders/views/manually_controlled_slider.dart';
import 'package:flutter_sliders/views/multiple_item_demo.dart';
import 'package:flutter_sliders/views/no_center_demo.dart';
import 'package:flutter_sliders/views/noon_looping_demo.dart';
import 'package:flutter_sliders/views/on_demand_carousel_demo.dart';
import 'package:flutter_sliders/views/prefetch_image_demo.dart';
import 'package:flutter_sliders/views/vertical_slider_demo.dart';
import 'package:flutter_sliders/views/widgets.dart';

void main() => runApp(const CarouselDemo());

final themeMode = ValueNotifier(2);

class CarouselDemo extends StatelessWidget {
  const CarouselDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(
          initialRoute: '/',
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.values.toList()[value],
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (ctx) => const CarouselDemoHome(),
            '/basic': (ctx) => const BasicDemo(),
            '/no-center': (ctx) => const NoCenterDemo(),
            '/image': (ctx) => const ImageSliderDemo(),
            '/complicated': (ctx) => const ComplicatedImageDemo(),
            '/enlarge': (ctx) => const EnlargeStrategyDemo(),
            '/manual': (ctx) => const ManuallyControlledSlider(),
            '/no-loop': (ctx) => const NoonLoopingDemo(),
            '/vertical': (ctx) => const VerticalSliderDemo(),
            '/full-screen': (ctx) => const FullScreenSliderDemo(),
            '/on-demand': (ctx) => const OnDemandCarouselDemo(),
            '/indicator': (ctx) => const CarouselWithIndicatorDemo(),
            '/prefetch': (ctx) => const PrefetchImageDemo(),
            '/reason': (ctx) => const CarouselChangeReasonDemo(),
            '/position': (ctx) => const KeepPageViewPositionDemo(),
            '/multiple': (ctx) => const MultipleItemDemo(),
            '/zoom': (ctx) => const EnlargeStrategyZoomDemo(),
            '/widgets': (context) => const WidgetsView(),
          },
        );
      },
      valueListenable: themeMode,
    );
  }
}

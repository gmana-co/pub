import 'package:flutter/material.dart';

import '../gmana_slider.dart';
import '../utils/colors.dart';
import '../utils/const.dart';
import '../utils/g_cache_image.dart';
import '../utils/g_dot_indicator.dart';

class BCTLImageCarousel extends StatefulWidget {
  final double? height;
  final List<String> images;
  final TextStyle positionTextStyle;
  final Color boxColor;
  final BoxFit boxFit;
  final bool autoPlay;
  final Duration? autoPlayInterval;
  final Cubic? curves;
  final Color dotColor;
  final bool showDot;
  final bool showCount;
  final DotType dotType;
  final bool isOutOfStock;
  final String outOfStockText;
  final TextStyle? outOfStockTextStyle;

  const BCTLImageCarousel({
    required this.images,
    this.height,
    required this.positionTextStyle,
    required this.boxColor,
    required this.boxFit,
    required this.autoPlay,
    required this.dotColor,
    this.showDot = true,
    this.showCount = true,
    this.autoPlayInterval,
    this.curves,
    this.dotType = DotType.circular,
    this.isOutOfStock = false,
    this.outOfStockText = '',
    this.outOfStockTextStyle,
    super.key,
  });

  @override
  State<BCTLImageCarousel> createState() => _BCTLImageCarouselState();
}

class _BCTLImageCarouselState extends State<BCTLImageCarousel> {
  late List<String> images;
  int position = 1;

  @override
  void initState() {
    super.initState();
    setState(() {
      images = widget.images;
    });
  }

  @override
  Widget build(BuildContext context) {
    return images.isEmpty
        ? const SizedBox()
        : Container(
            color: kBackground,
            alignment: Alignment.center,
            child: Stack(
              children: [
                GManaSlider(
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    viewportFraction: 1.0,
                    height: widget.height,
                    autoPlay: widget.autoPlay,
                    autoPlayInterval: widget.autoPlayInterval ?? const Duration(seconds: 3),
                    autoPlayCurve: widget.curves ?? Curves.fastOutSlowIn,
                    onPageChanged: (index, reason) {
                      // Update the state for current image position
                      setState(() {
                        position = index + 1;
                      });
                    },
                  ),
                  items: images.map(
                    (item) {
                      return GCacheImage(
                        imageUrl: item,
                        height: widget.height,
                        boxFit: widget.boxFit,
                      );
                    },
                  ).toList(),
                ),

                // show out of stock
                if (widget.isOutOfStock) ...[
                  /// Out of stock text
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black54.withOpacity(0.5),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(kMedium),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: kLarge,
                        right: kLarge,
                        top: kXSmall,
                        bottom: kXSmall,
                      ),
                      child: Text(
                        widget.outOfStockText,
                        style: widget.outOfStockTextStyle,
                      ),
                    ),
                  )
                ],

                if (widget.showCount)
                  Positioned(
                    top: kSmall,
                    left: kSmall,
                    child: Container(
                      padding: const EdgeInsets.only(left: kXSmall, right: kXSmall),
                      decoration: BoxDecoration(
                        color: widget.boxColor,
                        borderRadius: BorderRadius.circular(kMedium),
                      ),
                      child: Text(
                        '$position/${images.length}',
                        style: widget.positionTextStyle,
                      ),
                    ),
                  ),

                if (widget.showDot)
                  if (widget.dotType == DotType.rounded) ...[
                    Positioned(
                      bottom: kXXSmall,
                      right: kSmall,
                      left: kSmall,
                      child: GDotIndicator(
                        count: images.length,
                        position: position - 1,
                        dotColor: widget.dotColor,
                      ),
                    ),
                  ] else ...[
                    Positioned(
                      bottom: kXXSmall,
                      right: kSmall,
                      left: kSmall,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: images.asMap().entries.map((entry) {
                          return Container(
                            width: kSMedium,
                            height: kSMedium,
                            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness == Brightness.dark ? Colors.white : widget.dotColor).withOpacity(position == entry.key + 1 ? 0.9 : 0.4),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ]
              ],
            ),
          );
  }
}

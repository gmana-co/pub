import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'custom_cache_manager.dart';

class GCacheImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit? boxFit;

  const GCacheImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.boxFit,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return const SizedBox();
    }

    return CachedNetworkImage(
      key: UniqueKey(),
      imageUrl: imageUrl.toString(),
      width: width,
      height: height,
      fit: boxFit,
      placeholder: (context, url) => const Icon(Icons.image),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      cacheManager: CustomCacheManager.instance,
    );
  }
}

import 'package:flutter_cache_manager/flutter_cache_manager.dart';

/// singleton cache manager
class CustomCacheManager {
  static CacheManager instance = CacheManager(
    Config(
      'DewanImageCarousel',
      stalePeriod: const Duration(days: 7),
      maxNrOfCacheObjects: 100,
    ),
  );
}

import 'dart:async';

import 'package:flutter/material.dart';

import 'carousel_options.dart';
import 'carousel_state.dart';
import 'utils/get_real_index.dart';

abstract class GCarouselController {
  factory GCarouselController() => GCarouselControllerImpl();

  Future<void> get onReady;

  bool get ready;

  Future<void> animateToPage(int page, {Duration? duration, Curve? curve});

  void jumpToPage(int page);

  Future<void> nextPage({Duration? duration, Curve? curve});

  Future<void> previousPage({Duration? duration, Curve? curve});

  void startAutoPlay();

  void stopAutoPlay();
}

class GCarouselControllerImpl implements GCarouselController {
  final Completer<void> _readyCompleter = Completer<void>();

  CarouselState? _state;

  @override
  Future<void> get onReady => _readyCompleter.future;

  @override
  bool get ready => _state != null;

  set state(CarouselState? state) {
    _state = state;
    if (!_readyCompleter.isCompleted) {
      _readyCompleter.complete();
    }
  }

  /// Animates the controlled [CarouselSlider] from the current page to the given page.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  @override
  Future<void> animateToPage(int page, {Duration? duration = const Duration(milliseconds: 300), Curve? curve = Curves.linear}) async {
    final bool isNeedResetTimer = _state!.options.pauseAutoPlayOnManualNavigate;
    if (isNeedResetTimer) {
      _state!.onResetTimer();
    }
    final index = getRealIndex(_state!.pageController!.page!.toInt(), _state!.realPage - _state!.initialPage, _state!.itemCount);
    int smallestMovement = page - index;
    if (_state!.options.enableInfiniteScroll && _state!.itemCount != null && _state!.options.animateToClosest) {
      if ((page - index).abs() > (page + _state!.itemCount! - index).abs()) {
        smallestMovement = page + _state!.itemCount! - index;
      } else if ((page - index).abs() > (page - _state!.itemCount! - index).abs()) {
        smallestMovement = page - _state!.itemCount! - index;
      }
    }
    _setModeController();
    await _state!.pageController!.animateToPage(_state!.pageController!.page!.toInt() + smallestMovement, duration: duration!, curve: curve!);
    if (isNeedResetTimer) {
      _state!.onResumeTimer();
    }
  }

  /// Changes which page is displayed in the controlled [CarouselSlider].
  ///
  /// Jumps the page position from its current value to the given value,
  /// without animation, and without checking if the new value is in range.
  @override
  void jumpToPage(int page) {
    final index = getRealIndex(_state!.pageController!.page!.toInt(), _state!.realPage - _state!.initialPage, _state!.itemCount);

    _setModeController();
    final int pageToJump = _state!.pageController!.page!.toInt() + page - index;
    return _state!.pageController!.jumpToPage(pageToJump);
  }

  /// Animates the controlled [CarouselSlider] to the next page.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  @override
  Future<void> nextPage({Duration? duration = const Duration(milliseconds: 300), Curve? curve = Curves.linear}) async {
    final bool isNeedResetTimer = _state!.options.pauseAutoPlayOnManualNavigate;
    if (isNeedResetTimer) {
      _state!.onResetTimer();
    }
    _setModeController();
    await _state!.pageController!.nextPage(duration: duration!, curve: curve!);
    if (isNeedResetTimer) {
      _state!.onResumeTimer();
    }
  }

  /// Animates the controlled [CarouselSlider] to the previous page.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  @override
  Future<void> previousPage({Duration? duration = const Duration(milliseconds: 300), Curve? curve = Curves.linear}) async {
    final bool isNeedResetTimer = _state!.options.pauseAutoPlayOnManualNavigate;
    if (isNeedResetTimer) {
      _state!.onResetTimer();
    }
    _setModeController();
    await _state!.pageController!.previousPage(duration: duration!, curve: curve!);
    if (isNeedResetTimer) {
      _state!.onResumeTimer();
    }
  }

  /// Starts the controlled [CarouselSlider] autoPlay.
  ///
  /// The carousel will only autoPlay if the [autoPlay] parameter
  /// in [CarouselOptions] is true.
  @override
  void startAutoPlay() {
    _state!.onResumeTimer();
  }

  /// Stops the controlled [CarouselSlider] from autoPlaying.
  ///
  /// This is a more on-demand way of doing this. Use the [autoPlay]
  /// parameter in [CarouselOptions] to specify the autoPlay behavior of the carousel.
  @override
  void stopAutoPlay() {
    _state!.onResetTimer();
  }

  void _setModeController() => _state!.changeMode(CarouselPageChangedReason.controller);
}

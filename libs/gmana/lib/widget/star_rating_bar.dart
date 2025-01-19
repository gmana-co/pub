import 'package:flutter/material.dart';

class StarRatingBar extends StatelessWidget {
  /// The current rating value.
  final double ratingValue;

  /// The size of each star icon.
  final double starSize;

  /// The color of filled stars.
  final Color activeStarColor;

  /// The color of unfilled stars.
  final Color inactiveStarColor;

  /// The total number of stars to display.
  final int maxStars;

  /// The horizontal space between stars.
  final double starSpacing;

  /// Whether to allow half-star ratings.
  final bool enableHalfStar;

  /// The icon to use for filled stars.
  final IconData activeStarIcon;

  /// The icon to use for half-filled stars.
  final IconData halfStarIcon;

  /// The icon to use for empty stars.
  final IconData inactiveStarIcon;

  const StarRatingBar({
    super.key,
    required this.ratingValue,
    this.starSize = 14.0,
    this.activeStarColor = Colors.amber,
    this.inactiveStarColor = Colors.grey,
    this.maxStars = 5,
    this.starSpacing = 2.0,
    this.enableHalfStar = true,
    this.activeStarIcon = Icons.star,
    this.halfStarIcon = Icons.star_half,
    this.inactiveStarIcon = Icons.star_border,
  }) : assert(
          ratingValue >= 0 && ratingValue <= maxStars,
          'Rating value must be between 0 and $maxStars',
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        maxStars,
        (starIndex) => Padding(
          padding: EdgeInsets.only(right: starIndex < maxStars - 1 ? starSpacing : 0),
          child: _buildStarIcon(starIndex + 1),
        ),
      ),
    );
  }

  Widget _buildStarIcon(int starPosition) {
    IconData starIcon;
    Color starColor;

    if (starPosition <= ratingValue) {
      starIcon = activeStarIcon;
      starColor = activeStarColor;
    } else if (enableHalfStar && starPosition - ratingValue <= 0.5) {
      starIcon = halfStarIcon;
      starColor = activeStarColor;
    } else {
      starIcon = inactiveStarIcon;
      starColor = inactiveStarColor;
    }

    return Icon(
      starIcon,
      color: starColor,
      size: starSize,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';

typedef RatingChangeCallback = void Function(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback? onRatingChanged;
  final Color? color;

  const StarRating(
      {this.starCount = 5, this.rating = .0, this.onRatingChanged, this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = const Icon(
        Icons.star_border,
        color: AppColors.grey,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: color ?? AppColors.yellow,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: color ?? AppColors.yellow,
      );
    }

    return InkResponse(
      onTap:
          onRatingChanged == null ? null : () => onRatingChanged!(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children:
            List.generate(starCount, (index) => buildStar(context, index)));
  }
}

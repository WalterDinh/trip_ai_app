import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';

class RatingBar extends StatefulWidget {
  final Function(int rating)? onRatingChanged;

  const RatingBar({this.onRatingChanged});

  @override
  State<RatingBar> createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) => buildStar(context, index)));
  }

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    icon = index >= rating
        ? const Icon(Icons.star, size: 38)
        : const Icon(Icons.star, size: 38, color: AppColors.yellow);

    return InkResponse(
      onTap: () {
        setState(() {
          rating = index + 1;
          widget.onRatingChanged?.call(rating);
        });
      },
      child: icon,
    );
  }
}

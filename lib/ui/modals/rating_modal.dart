import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/configs/theme.dart';
import 'package:my_app/ui/widgets/rating_bar.dart';
import 'package:my_app/ui/widgets/spacer.dart';

class RatingModal extends StatefulWidget {
  const RatingModal({Key? key}) : super(key: key);

  @override
  State<RatingModal> createState() => _RatingModalState();
}

class _RatingModalState extends State<RatingModal> {
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Enjoying the trip?',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: AppColors.darkGreen),
            ),
            const VSpacer(24),
            RatingBar(
              onRatingChanged: (value) {
                rating = value;
              },
            ),
            const VSpacer(24),
            _rowButton()
          ],
        ),
      ),
    );
  }

  Row _rowButton() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
              style: ElevatedButtonThemeApp.lightElevatedButtonTheme.style,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel')),
        ),
        const HSpacer(16),
        Expanded(
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(rating);
              },
              child: const Text('Rate')),
        ),
      ],
    );
  }
}

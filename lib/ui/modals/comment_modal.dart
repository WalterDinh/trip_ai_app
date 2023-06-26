import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/configs/theme.dart';
import 'package:my_app/ui/widgets/spacer.dart';

class CommentModal extends StatelessWidget {
  CommentModal({Key? key}) : super(key: key);

  final _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _topLabel(context),
            const VSpacer(14),
            _textFieldComment(),
            const VSpacer(24),
            _rowButton(context)
          ],
        ),
      ),
    );
  }

  Row _rowButton(BuildContext context) {
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
                String comment = _commentController.value.text;
                Navigator.of(context).pop(comment);
              },
              child: const Text('Comment')),
        ),
      ],
    );
  }

  TextField _textFieldComment() {
    return TextField(
      controller: _commentController,
      maxLines: 10,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        hintText: 'Write your comment',
        hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.grey800),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Text _topLabel(BuildContext context) {
    return Text(
      'Your Comment:',
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(color: AppColors.darkGreen),
    );
  }
}

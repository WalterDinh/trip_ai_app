import 'package:flutter/material.dart';
import 'package:my_app/core/base/base_widget_mixin.dart';
import 'package:my_app/ui/widgets/modal.dart';
import 'package:my_app/ui/widgets/ripple.dart';
import 'package:my_app/ui/widgets/spacer.dart';

enum Gender { male, female }

class GenderModal extends StatelessWidget with BaseWidgetMixin {
  const GenderModal({Key? key, this.onChooseGender}) : super(key: key);

  final Function(Gender)? onChooseGender;

  @override
  Widget body(BuildContext context) {
    return Modal(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Text('Gender', style: Theme.of(context).textTheme.headlineMedium),
            const VSpacer(24),
            Ripple(
                onTap: () => onChooseGender?.call(Gender.male),
                child: const Text('Male')),
            const VSpacer(16),
            Ripple(
                onTap: () => onChooseGender?.call(Gender.female),
                child: const Text('Female')),
            const VSpacer(16),
          ],
        ),
      ),
    );
  }
}

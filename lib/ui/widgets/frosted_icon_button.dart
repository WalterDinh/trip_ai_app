import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/ui/widgets/ripple.dart';

class FrostedIconButton extends StatelessWidget {
  const FrostedIconButton({Key? key, required this.icon, this.onTap})
      : super(key: key);

  final String icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    double buttonSize = 44;

    return Ripple(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: buttonSize,
            height: buttonSize,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
            ),
            child: SvgPicture.asset(icon),
          ),
        ),
      ),
    );
  }
}

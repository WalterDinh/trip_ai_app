import 'package:flutter/material.dart';

const String _imagePath = 'assets/images';

class _Image extends AssetImage {
  const _Image(String fileName) : super('$_imagePath/$fileName');
}

class AppImages {
  static const introduction1 = _Image('introduction1.png');
  static const introduction2 = _Image('introduction2.png');
  static const introduction3 = _Image('introduction3.png');
  static const welcome = _Image('welcome.png');
  static const googleIcon = '$_imagePath/ic_google.svg';
  static const facebookIcon = '$_imagePath/ic_facebook.svg';
  static const appleIcon = '$_imagePath/ic_apple.svg';
  // static const pikloader = _Image('pika_loader.gif');

  // static Future precacheAssets(BuildContext context) async {}
}
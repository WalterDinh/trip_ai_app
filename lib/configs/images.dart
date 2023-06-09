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
  static const homeIcon = '$_imagePath/ic_home.svg';
  static const myTripIcon = '$_imagePath/ic_my_trip.svg';
  static const addIcon = '$_imagePath/ic_add.svg';
  static const notificationIcon = '$_imagePath/ic_notification.svg';
  static const profileIcon = '$_imagePath/ic_profile.svg';
  static const deleteIcon = '$_imagePath/ic_delete.svg';
  static const heartIcon = '$_imagePath/ic_heart.svg';
  static const shareIcon = '$_imagePath/ic_share.svg';
  static const circleAddIcon = '$_imagePath/ic_add_circle.svg';
  static const settingIcon = '$_imagePath/ic_setting.svg';
  static const cityIcon = '$_imagePath/ic_city.svg';
  static const countryIcon = '$_imagePath/ic_country.svg';
  static const distanceIcon = '$_imagePath/ic_distance.svg';
  static const tripCountIcon = '$_imagePath/ic_trip_count.svg';
  static const outlineAddIcon = '$_imagePath/ic_add_outline.svg';
  static const outlineCheckIcon = '$_imagePath/ic_check_outline.svg';
  static const addUserIcon = '$_imagePath/ic_add_user.svg';
}

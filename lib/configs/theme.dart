import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/core/values/app_values.dart';

import 'fonts.dart';

class Theming {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.darkGreen,
    appBarTheme: const AppBarTheme(
      toolbarTextStyle: TextThemeApp.darkText,
    ),
    iconTheme: IconThemeApp.iconDartTheme,
    inputDecorationTheme: InputDecorationThemeApp.dartInputDecorationStyle,
    textTheme: TextThemeApp.dartTextTheme,
    outlinedButtonTheme: OutlinedButtonThemeApp.dartOutlinedButtonTheme,
    elevatedButtonTheme: ElevatedButtonThemeApp.dartElevatedButtonTheme,
    scaffoldBackgroundColor: AppColors.black,
    focusColor: AppColors.whiteGrey,
    hintColor: AppColors.conch,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
      background: AppColors.whiteGrey,
      brightness: Brightness.dark,
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.darkGreen,
    iconTheme: IconThemeApp.iconLightTheme,
    appBarTheme: const AppBarTheme(
      toolbarTextStyle: TextThemeApp.lightText,
    ),
    inputDecorationTheme: InputDecorationThemeApp.lightInputDecorationStyle,
    outlinedButtonTheme: OutlinedButtonThemeApp.lightOutlinedButtonTheme,
    elevatedButtonTheme: ElevatedButtonThemeApp.lightElevatedButtonTheme,
    textTheme: TextThemeApp.lightTextTheme,
    scaffoldBackgroundColor: AppColors.lightGrey,
    disabledColor: AppColors.grey,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
        background: AppColors.whiteGrey, brightness: Brightness.light),
  );
}

class InputDecorationThemeApp {
  static InputDecorationTheme inputDecorationStyle = InputDecorationTheme(
    // filled: true,
    labelStyle: TextThemeApp.labelMediumText,

    hintStyle: const TextStyle(color: AppColors.grey),
    fillColor: Colors.black,
    prefixStyle: TextStyle(
      color: Colors.black.withOpacity(0.6),
    ),
  );

  static const InputDecorationTheme lightInputDecorationStyle =
      InputDecorationTheme(
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.darkGreen),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.darkGreen),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.grey),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
  );

  static const InputDecorationTheme dartInputDecorationStyle =
      InputDecorationTheme(
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.darkGreen),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.darkGreen),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.grey),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
  );
}

class TextButtonThemeApp {
  static ButtonStyle textButtonStyle = TextButton.styleFrom(
      padding: const EdgeInsets.all(16),
      textStyle: const TextStyle(fontWeight: FontWeight.w700));

  static final TextButtonThemeData lightTextButtonTheme = TextButtonThemeData(
      style: textButtonStyle.merge(TextButton.styleFrom(
    foregroundColor: AppColors.whiteGrey,
  )));

  static final TextButtonThemeData dartTextButtonTheme = TextButtonThemeData(
      style: textButtonStyle.merge(TextButton.styleFrom(
    foregroundColor: AppColors.grey,
  )));
}

class ElevatedButtonThemeApp {
  static ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      textStyle: const TextStyle(fontWeight: FontWeight.w700));

  static final ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
          style: elevatedButtonStyle.merge(OutlinedButton.styleFrom(
              backgroundColor: AppColors.lightGrey,
              foregroundColor: AppColors.darkGreen,
              disabledBackgroundColor: AppColors.grey)));

  static final ElevatedButtonThemeData dartElevatedButtonTheme =
      ElevatedButtonThemeData(
          style: elevatedButtonStyle.merge(OutlinedButton.styleFrom(
              backgroundColor: AppColors.darkGreen,
              foregroundColor: AppColors.lightGrey,
              disabledBackgroundColor: AppColors.grey)));
}

class OutlinedButtonThemeApp {
  static ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
      padding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      textStyle: const TextStyle(fontWeight: FontWeight.w700));

  static final OutlinedButtonThemeData lightOutlinedButtonTheme =
      OutlinedButtonThemeData(
          style: outlineButtonStyle.merge(OutlinedButton.styleFrom(
    backgroundColor: AppColors.lightGrey,
    foregroundColor: AppColors.black,
    side: const BorderSide(color: AppColors.black, width: 2),
  )));

  static final OutlinedButtonThemeData dartOutlinedButtonTheme =
      OutlinedButtonThemeData(
          style: outlineButtonStyle.merge(OutlinedButton.styleFrom(
    backgroundColor: AppColors.black,
    foregroundColor: AppColors.lightGrey,
    side: const BorderSide(color: AppColors.lightGrey, width: 2),
  )));
}

class IconThemeApp {
  static const IconThemeData iconDartTheme = IconThemeData(
    color: AppColors.lighterGrey,
    size: AppValues.iconSize_18,
  );
  static const IconThemeData iconLightTheme = IconThemeData(
    color: AppColors.blueGrey,
    size: AppValues.iconSize_18,
  );
}

class TextThemeApp {
  static const TextStyle darkText = TextStyle(
    color: AppColors.black,
    fontFamily: AppFonts.workSans,
  );

  static const TextStyle lightText = TextStyle(
    color: AppColors.black,
    fontFamily: AppFonts.workSans,
  );

  static const TextStyle headlineLargeText =
      TextStyle(fontSize: 40, height: 1.12, fontWeight: FontWeight.w700);
  static const TextStyle headlineMediumText =
      TextStyle(fontSize: 24, height: 14 / 11, fontWeight: FontWeight.w700);
  static const TextStyle headlineSmallText =
      TextStyle(fontSize: 20, height: 10 / 7, fontWeight: FontWeight.w600);

  static const TextStyle bodyLargeText =
      TextStyle(fontSize: 18, height: 4 / 3, fontWeight: FontWeight.w700);
  static const TextStyle bodyMediumText =
      TextStyle(fontSize: 14, height: 9 / 7, fontWeight: FontWeight.w500);
  static const TextStyle bodySmallText =
      TextStyle(fontSize: 13, height: 18 / 16, fontWeight: FontWeight.w400);
  static const TextStyle bodySmallerText =
      TextStyle(fontSize: 12, fontWeight: FontWeight.w300);

  static const TextStyle labelLargeText =
      TextStyle(fontSize: 16, height: 3 / 2, fontWeight: FontWeight.w600);
  static const TextStyle labelMediumText =
      TextStyle(fontSize: 14, height: 9 / 7, fontWeight: FontWeight.w500);
  static const TextStyle labelSmallText =
      TextStyle(fontSize: 13, height: 16 / 13, fontWeight: FontWeight.w400);

  static const TextStyle displayLargeText =
      TextStyle(fontSize: 15, height: 4 / 3, fontWeight: FontWeight.w600);
  static const TextStyle displayMediumText =
      TextStyle(fontSize: 14, height: 9 / 7, fontWeight: FontWeight.w500);
  static const TextStyle displaySmallText =
      TextStyle(fontSize: 10, height: 13 / 16, fontWeight: FontWeight.w500);

  static const TextStyle titleLargeText =
      TextStyle(fontSize: 18, height: 4 / 3, fontWeight: FontWeight.w600);
  static const TextStyle titleMediumText =
      TextStyle(fontSize: 16, height: 9 / 7, fontWeight: FontWeight.w500);
  static const TextStyle titleSmallText =
      TextStyle(fontSize: 13, height: 13 / 16, fontWeight: FontWeight.w400);

  static final TextTheme lightTextTheme = TextTheme(
      bodyLarge: lightText.merge(bodyLargeText),
      bodyMedium: lightText.merge(bodyMediumText),
      bodySmall: lightText.merge(bodySmallText),
      labelLarge: lightText.merge(labelLargeText),
      labelMedium: lightText.merge(labelMediumText),
      labelSmall: lightText.merge(labelSmallText),
      headlineLarge: lightText.merge(headlineLargeText),
      headlineMedium: lightText.merge(headlineMediumText),
      headlineSmall: lightText.merge(headlineSmallText),
      displayLarge: lightText.merge(displayLargeText),
      displayMedium: lightText.merge(displayMediumText),
      displaySmall: lightText.merge(displaySmallText),
      titleLarge: lightText.merge(titleLargeText),
      titleMedium: lightText.merge(titleMediumText),
      titleSmall: lightText.merge(titleSmallText));

  static final TextTheme dartTextTheme = TextTheme(
      bodyLarge: darkText.merge(bodyLargeText),
      bodyMedium: darkText.merge(bodyMediumText),
      bodySmall: darkText.merge(bodySmallText),
      labelLarge: darkText.merge(labelLargeText),
      labelMedium: darkText.merge(labelMediumText),
      labelSmall: darkText.merge(labelSmallText),
      headlineLarge: darkText.merge(headlineLargeText),
      headlineMedium: darkText.merge(headlineMediumText),
      headlineSmall: darkText.merge(headlineSmallText),
      displayLarge: darkText.merge(displayLargeText),
      displayMedium: darkText.merge(displayMediumText),
      displaySmall: darkText.merge(displaySmallText),
      titleLarge: darkText.merge(titleLargeText),
      titleMedium: darkText.merge(titleMediumText),
      titleSmall: darkText.merge(titleSmallText));
}

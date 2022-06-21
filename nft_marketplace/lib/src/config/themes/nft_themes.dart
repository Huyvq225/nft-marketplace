import 'package:flutter/material.dart';

class NftThemeData {
  NftThemeData._();

  static ThemeData lightThemeData = _lightTheme();
  static ThemeData darkThemeData = _darkTheme();

  static ThemeData _lightTheme() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'SF UI Text',
      brightness: Brightness.light,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }

  static ThemeData _darkTheme() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'SF UI Text',
      brightness: Brightness.dark,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}

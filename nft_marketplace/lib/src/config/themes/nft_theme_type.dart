
import 'package:flutter/material.dart';
import 'package:nft_marketplace/src/config/themes/nft_themes.dart';

enum NftTheme {
  light,
  dark
}

extension NftThemeExtension on NftTheme {

  ThemeData get theme {
    switch(this) {
      case NftTheme.light:
        return NftThemeData.lightThemeData;
      case NftTheme.dark:
        return NftThemeData.darkThemeData;
    }
  }
}
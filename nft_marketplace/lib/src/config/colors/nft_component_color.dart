import 'package:flutter/material.dart';
import 'package:nft_marketplace/src/config/colors/nft_dark_colors.dart';
import 'package:nft_marketplace/src/config/colors/nft_light_colors.dart';

abstract class NftComponentColor {
  factory NftComponentColor(Brightness brightness) {
    if (brightness == Brightness.light) {
      return NftLightComponentColor();
    }
    if (brightness == Brightness.dark) {
      return NftDarkComponentColor();
    }
    return NftLightComponentColor();
  }

  static NftComponentColor of(BuildContext context) {
    return NftComponentColor(Theme.of(context).brightness);
  }

  Color? get background;

  Color? get appBarTitle;

  Color? get appBarBackground;

  Color? get text;

  Color? get textHighLight;

  Color? get buttonTitle;

  Color? get buttonBackground;

  Color? get bottomNavigationBackground;

  Color? get bottomNavigationSelected;

  Color? get bottomNavigationDeselected;

  Color? get positivePercent;

  Color? get negativePercent;

  Color? get price;
}

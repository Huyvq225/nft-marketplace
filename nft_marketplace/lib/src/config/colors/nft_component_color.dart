import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nft_marketplace/src/config/colors/nft_colors.dart';
import 'package:nft_marketplace/src/config/themes/nft_theme_type.dart';
import 'package:nft_marketplace/src/config/themes/nft_themes.dart';
import 'package:nft_marketplace/src/core/bloc/theme/theme_bloc.dart';

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
}

class NftLightComponentColor implements NftComponentColor {
  final NFTColors _nftColors = NFTColors();

  @override
  Color? get appBarTitle => _nftColors.neutralColor;

  @override
  Color? get appBarBackground => _nftColors.neutral[100];

  @override
  Color? get background => _nftColors.neutral[100];

  @override
  Color? get buttonBackground => _nftColors.neutral[100];

  @override
  Color? get buttonTitle => _nftColors.primaryColor;

  @override
  Color? get text => _nftColors.neutralColor;

  @override
  Color get textHighLight => _nftColors.primaryColor;
}

class NftDarkComponentColor implements NftComponentColor {
  final NFTColors _nftColors = NFTColors();

  @override
  Color? get appBarTitle => _nftColors.neutral[100];

  @override
  Color? get appBarBackground => _nftColors.neutralColor;

  @override
  Color? get background => _nftColors.neutral[700];

  @override
  Color? get buttonBackground => _nftColors.neutralColor;

  @override
  Color? get buttonTitle => _nftColors.neutral[100];

  @override
  Color? get text => _nftColors.neutral[100];

  @override
  Color get textHighLight => _nftColors.primaryColor;
}

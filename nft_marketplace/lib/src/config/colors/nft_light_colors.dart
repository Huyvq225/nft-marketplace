import 'package:flutter/material.dart';
import 'package:nft_marketplace/src/config/colors/nft_colors.dart';
import 'package:nft_marketplace/src/config/colors/nft_component_color.dart';

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

  @override
  Color? get bottomNavigationBackground => _nftColors.neutral[100];

  @override
  Color? get bottomNavigationSelected => _nftColors.primaryColor;

  @override
  Color? get bottomNavigationDeselected => _nftColors.neutral[600];
}

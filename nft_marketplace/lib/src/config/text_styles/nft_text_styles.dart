import 'package:flutter/material.dart';

enum NFTTypography {
  t30B,
  t30R,
  t20S,
  t18B,
  t18S,
  t16B,
  t16S,
  t16R,
  t14B,
  t14S,
  t14M,
  t14R,
  t12S,
  t12B,
  t12M,
  t12R,
  t11R,
  t10S,
  t10M,
  t10R
}

extension NFTTypographyExtension on NFTTypography {
  static const kRegular = FontWeight.w400;
  static const kMedium = FontWeight.w500;
  static const kSemiBold = FontWeight.w600;
  static const kBold = FontWeight.w700;

  TextStyle style({Color? fontColor}) {
    switch (this) {
      case NFTTypography.t30B:
        return _getStyle(fontSize: 30, fontWeight: kBold, fontColor: fontColor);
      case NFTTypography.t30R:
        return _getStyle(
            fontSize: 30, fontWeight: kRegular, fontColor: fontColor);
      case NFTTypography.t20S:
        return _getStyle(
            fontSize: 20, fontWeight: kSemiBold, fontColor: fontColor);
      case NFTTypography.t18B:
        return _getStyle(fontSize: 18, fontWeight: kBold, fontColor: fontColor);
      case NFTTypography.t18S:
        return _getStyle(
            fontSize: 18, fontWeight: kSemiBold, fontColor: fontColor);
      case NFTTypography.t16B:
        return _getStyle(fontSize: 16, fontWeight: kBold, fontColor: fontColor);
      case NFTTypography.t16S:
        return _getStyle(
            fontSize: 16, fontWeight: kSemiBold, fontColor: fontColor);
      case NFTTypography.t16R:
        return _getStyle(
            fontSize: 16, fontWeight: kRegular, fontColor: fontColor);
      case NFTTypography.t14B:
        return _getStyle(fontSize: 14, fontWeight: kBold, fontColor: fontColor);
      case NFTTypography.t14S:
        return _getStyle(
            fontSize: 14, fontWeight: kSemiBold, fontColor: fontColor);
      case NFTTypography.t14M:
        return _getStyle(
            fontSize: 14, fontWeight: kMedium, fontColor: fontColor);
      case NFTTypography.t14R:
        return _getStyle(
            fontSize: 14, fontWeight: kRegular, fontColor: fontColor);
      case NFTTypography.t12B:
        return _getStyle(fontSize: 12, fontWeight: kBold, fontColor: fontColor);
      case NFTTypography.t12S:
        return _getStyle(
            fontSize: 12, fontWeight: kSemiBold, fontColor: fontColor);
      case NFTTypography.t12M:
        return _getStyle(
            fontSize: 12, fontWeight: kMedium, fontColor: fontColor);
      case NFTTypography.t12R:
        return _getStyle(
            fontSize: 12, fontWeight: kRegular, fontColor: fontColor);
      case NFTTypography.t10S:
        return _getStyle(
            fontSize: 10, fontWeight: kSemiBold, fontColor: fontColor);
      case NFTTypography.t10M:
        return _getStyle(
            fontSize: 10, fontWeight: kMedium, fontColor: fontColor);
      case NFTTypography.t10R:
        return _getStyle(
            fontSize: 10, fontWeight: kRegular, fontColor: fontColor);
      default:
        return _getStyle();
    }
  }

  TextStyle _getStyle(
      {double fontSize = 12,
      FontWeight fontWeight = FontWeight.w400,
      Color? fontColor}) {
    return TextStyle(
        fontSize: fontSize, fontWeight: fontWeight, color: fontColor);
  }
}

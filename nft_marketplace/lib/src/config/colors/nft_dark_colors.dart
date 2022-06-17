import 'package:flutter/material.dart';
import 'package:nft_marketplace/src/config/colors/nft_colors.dart';

class NFTDarkColors implements NFTColors {
  static const Color kPrimaryColor = Color(0xFF6405D6);
  static const Color kGreenSecondaryColor = Color(0xFF32E875);
  static const Color kYellowSecondaryColor = Color(0xFFFFC147);
  static const Color kRedSecondaryColor = Color(0xFFFF5869);
  static const Color kBlueSecondaryColor = Color(0xFF54C7FC);
  static const Color kNeutralColor = Color(0xFF000500);

  @override
  Color get primaryColor => kPrimaryColor;

  @override
  Color get greenSecondaryColor => kGreenSecondaryColor;

  @override
  Color get yellowSecondaryColor => kYellowSecondaryColor;

  @override
  Color get redSecondaryColor => kRedSecondaryColor;

  @override
  Color get blueSecondaryColor => kBlueSecondaryColor;

  @override
  Color get neutralColor => kNeutralColor;

  @override
  MaterialColor get purple => MaterialColor(
        kPrimaryColor.value,
        const <int, Color>{
          100: Color(0xFFF7F2FD),
          200: Color(0xFFE8DAF9),
          300: Color(0xFFD8C0F5),
          400: Color(0xFFC19BEF),
          500: Color(0xFFA269E6),
          600: Color(0xFF8337DE),
          700: kPrimaryColor,
          800: Color(0xFF5504B6),
          900: Color(0xFF450395),
        },
      );

  @override
  MaterialColor get green => MaterialColor(
        kGreenSecondaryColor.value,
        const <int, Color>{
          100: Color(0xFFEAFCF1),
          200: Color(0xFFCCF9DC),
          300: Color(0xFFADF6C8),
          400: Color(0xFF84F1AC),
          500: Color(0xFF5BED91),
          600: kGreenSecondaryColor,
          700: Color(0xFF22CD61),
          800: Color(0xFF12B94F),
          900: Color(0xFF039338),
        },
      );

  @override
  MaterialColor get blue => MaterialColor(
        kBlueSecondaryColor.value,
        const <int, Color>{
          100: Color(0xFFEDF9FE),
          200: Color(0xFFDDF4FE),
          300: Color(0xFFBBE9FE),
          400: Color(0xFF98DDFD),
          500: Color(0xFF76D2FD),
          600: kBlueSecondaryColor,
          700: Color(0xFF39AADF),
          800: Color(0xFF2094CA),
          900: Color(0xFF107CAE),
        },
      );

  @override
  MaterialColor get red => MaterialColor(
        kRedSecondaryColor.value,
        const <int, Color>{
          100: Color(0xFFFFEEF0),
          200: Color(0xFFFFDEE1),
          300: Color(0xFFFFBCC3),
          400: Color(0xFFFF9BA5),
          500: Color(0xFFFF7987),
          600: kRedSecondaryColor,
          700: Color(0xFFED4455),
          800: Color(0xFFDF3748),
          900: Color(0xFFBA1828),
        },
      );

  @override
  MaterialColor get yellow => MaterialColor(
        kYellowSecondaryColor.value,
        const <int, Color>{
          100: Color(0xFFFFF8EC),
          200: Color(0xFFFFF3DA),
          300: Color(0xFFFFE6B5),
          400: Color(0xFFFFDA91),
          500: Color(0xFFFFCD6C),
          600: kYellowSecondaryColor,
          700: Color(0xFFE5AD3F),
          800: Color(0xFFD8981B),
          900: Color(0xFFB07604),
        },
      );

  @override
  MaterialColor get neutral => MaterialColor(
        kNeutralColor.value,
        const <int, Color>{
          100: Color(0xFFFFFFFF),
          200: Color(0xFFF7F7F7),
          300: Color(0xFFEAEBEA),
          400: Color(0xFFCACBCA),
          500: Color(0xFFA6A6A6),
          600: Color(0xFF7F827F),
          700: Color(0xFF4C504C),
          800: Color(0xFF1A1E1A),
          900: kNeutralColor,
        },
      );
}

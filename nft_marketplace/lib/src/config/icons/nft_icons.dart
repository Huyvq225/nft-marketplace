import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

abstract class NFTIcons {
  factory NFTIcons() {
    if (kIsWeb) {
      return NFTWebIcons();
    } else {
      if (Platform.isIOS) {
        return NFTMobileIcons();
      } else if (Platform.isAndroid) {
        return NFTMobileIcons();
      }
    }
    return NFTMobileIcons();
  }

  String get homeTab;

  String get rankingTab;

  String get walletTab;

  String get moreTab;
}

class NFTMobileIcons implements NFTIcons {
  @override
  String get homeTab => 'assets/icons/ic_16_Home_Tab.svg';

  @override
  String get moreTab => 'assets/icons/ic_16_More_Tab.svg';

  @override
  String get rankingTab => 'assets/icons/ic_16_Ranking_Tab.svg';

  @override
  String get walletTab => 'assets/icons/ic_16_Wallet_Tab.svg';
}

class NFTWebIcons implements NFTIcons {
  @override
  String get homeTab => 'assets/icons/ic_16_Home_Tab.svg';

  @override
  String get moreTab => 'assets/icons/ic_16_More_Tab.svg';

  @override
  String get rankingTab => 'assets/icons/ic_16_Ranking_Tab.svg';

  @override
  String get walletTab => 'assets/icons/ic_16_Wallet_Tab.svg';
}

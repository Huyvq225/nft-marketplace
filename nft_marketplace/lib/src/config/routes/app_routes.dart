import 'package:flutter/material.dart';
import 'package:nft_marketplace/src/config/routes/routes_name.dart';
import 'package:nft_marketplace/src/injector.dart';
import 'package:nft_marketplace/src/presentation/views/main_page/main_page.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case kMainPage:
        return _materialRoute(MainPage(injector()));
      default:
        return _materialRoute(MainPage(injector()));
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}

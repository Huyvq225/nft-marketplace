import 'package:flutter/material.dart';
import 'package:nft_marketplace/src/config/routes/routes_name.dart';
import 'package:nft_marketplace/src/presentation/views/main_page/main_page.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case kMainPage:
        return _materialRoute(const MainPage());
      default:
        return _materialRoute(const MainPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
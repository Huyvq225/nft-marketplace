import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nft_marketplace/src/config/routes/routes_name.dart';
import 'package:nft_marketplace/src/injector.dart';
import 'package:nft_marketplace/src/presentation/views/main_page/bloc/main_page_bloc.dart';
import 'package:nft_marketplace/src/presentation/views/main_page/main_page.dart';
import 'package:nft_marketplace/src/presentation/views/nft/nft_detail/nft_detail_page.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case kMainPage:
        return _materialRoute(
            name: kMainPage,
            page: BlocProvider<MainPageBloc>(
              create: (_) => injector.get<MainPageBloc>()
                ..add(
                  const MainPageInitialEvent(),
                ),
              child: const MainPage(),
            ));
      case kNftDetail:
        return _materialRoute(name: kNftDetail, page: const NFTDetailPage());
      default:
        return _materialRoute(name: kUnknownRoute, page: Container());
    }
  }

  static Route<dynamic> _materialRoute(
      {required String name, required Widget page}) {
    return MaterialPageRoute(
      builder: (_) => page,
      settings: RouteSettings(name: name),
    );
  }
}

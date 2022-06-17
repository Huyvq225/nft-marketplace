import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nft_marketplace/src/core/bloc/theme/theme_bloc.dart';

import 'src/config/routes/app_routes.dart';
import 'src/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const NFTMarketplaceApp());
}

class NFTMarketplaceApp extends StatelessWidget {
  const NFTMarketplaceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc(),
        ),
      ],
      child: _buildMainThemeApp(),
    );
  }

  Widget _buildMainThemeApp() {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (_, state) {
        return MaterialApp(
          title: 'nft marketplace',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          theme: state.themeData,
        );
      },
    );
  }
}

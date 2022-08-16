import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nft_marketplace/src/config/env/env_config.dart';
import 'package:nft_marketplace/src/config/localization/app_localization.dart';
import 'package:nft_marketplace/src/core/bloc/lang/lang_bloc.dart';
import 'package:nft_marketplace/src/core/bloc/theme/theme_bloc.dart';

import 'src/config/routes/app_routes.dart';
import 'src/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  await EnvConfig.getInfo();
  runApp(NFTMarketplaceApp());
}

// ignore: must_be_immutable
class NFTMarketplaceApp extends StatelessWidget {
  NFTMarketplaceApp({Key? key}) : super(key: key);

  Locale? _locale;
  ThemeData? _themeData;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //Theme bloc
        BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc(),
        ),
        //Language bloc
        BlocProvider<LangBloc>(
          create: (_) => LangBloc(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<ThemeBloc, ThemeState>(
            listener: (_, themeState) {
              _themeData = themeState.themeData;
            },
          ),
          BlocListener<LangBloc, LangState>(
            listener: (_, langState) {
              if (langState is LanguageLoadedState) {
                _locale = langState.langType.locale;
              }
            },
          ),
        ],
        child: _blocBuilders(),
      ),
    );
  }

  Widget _blocBuilders() {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (_, themeState) {
        return BlocBuilder<LangBloc, LangState>(
          builder: (_, langState) {
            return _mainAppBody();
          },
        );
      },
    );
  }

  Widget _mainAppBody() {
    return MaterialApp(
      title: 'nft marketplace',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      theme: _themeData,
      supportedLocales: [
        LanguageType.en.locale,
        LanguageType.vi.locale,
      ],
      locale: _locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (Locale supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode ||
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}

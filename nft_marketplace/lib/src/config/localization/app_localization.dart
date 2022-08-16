import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  // AppLocalizations(this.locale);

  // final Locale locale;

  static final AppLocalizations _singleton = AppLocalizations._internal();
  AppLocalizations._internal();
  static AppLocalizations get instance => _singleton;


  // static AppLocalizations? of(BuildContext context) {
  //   return Localizations.of<AppLocalizations>(context, AppLocalizations);
  // }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  Map<dynamic, dynamic>? _localisedValues;

  Future<AppLocalizations> load(Locale locale) async {
    final _langData =
        await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    Map<String, dynamic> _langMap = json.decode(_langData);

    _localisedValues = _langMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return this;
  }

  String translate(String key) {
    return _localisedValues?[key] ?? '$key not found';
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'vi'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final _appLocalizations = await AppLocalizations.instance.load(locale);
    return _appLocalizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => true;
}

extension TranslateStringExtension on String {
  String tr() {
    return AppLocalizations.instance.translate(this);
  }
}
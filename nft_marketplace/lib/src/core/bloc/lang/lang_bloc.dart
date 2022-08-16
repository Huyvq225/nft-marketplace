import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'lang_event.dart';

part 'lang_state.dart';

enum LanguageType { en, vi }

extension LanguageTypeExtension on LanguageType {
  Locale get locale {
    switch(this) {
      case LanguageType.en:
        return const Locale('en', 'US');
      case LanguageType.vi:
        return const Locale('vi', 'VN');
      default:
        return const Locale('en', 'US');
    }
  }
}

class LangBloc extends Bloc<LangEvent, LangState> {
  LangBloc() : super(LangInitial()) {
    on<ChangeLocaleEvent>(_changeLocale);
  }

  Future<void> _changeLocale(
      ChangeLocaleEvent event, Emitter<LangState> emit) async {
    _langType = event.langType;
    emit(LanguageLoadedState(_langType));
  }

  LanguageType _langType = LanguageType.en;
}

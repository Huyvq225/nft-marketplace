import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nft_marketplace/src/config/themes/nft_theme_type.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: NftTheme.light.theme)) {
    on<InitialThemeEvent>(_initialTheme);
    on<ThemeChangedEvent>(_changingTheme);
  }

  Future<void> _initialTheme(
      InitialThemeEvent event, Emitter<ThemeState> emit) async {
    emit(ThemeState(themeData: themeData.theme));
  }

  Future<void> _changingTheme(
      ThemeChangedEvent event, Emitter<ThemeState> emit) async {
    themeData = themeData == NftTheme.light ? NftTheme.dark : NftTheme.light ;
    emit(ThemeState(themeData: themeData.theme));
  }

  NftTheme themeData = NftTheme.light;
}

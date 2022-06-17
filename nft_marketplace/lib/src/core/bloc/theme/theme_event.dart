part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent extends Equatable{}

class InitialThemeEvent extends ThemeEvent {
  @override
  List<Object> get props => [];
}

class ThemeChangedEvent extends ThemeEvent {
  @override
  List<Object> get props => [];
}


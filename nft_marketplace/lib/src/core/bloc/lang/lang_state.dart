part of 'lang_bloc.dart';

abstract class LangState extends Equatable {
  const LangState();
}

class LangInitial extends LangState {
  @override
  List<Object> get props => [];
}

class LanguageLoadedState extends LangState {

  const LanguageLoadedState(this.langType);

  final LanguageType langType;

  @override
  List<Object?> get props => [langType];

}
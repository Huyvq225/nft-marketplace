part of 'lang_bloc.dart';

abstract class LangEvent extends Equatable {
  const LangEvent();
}

class ChangeLocaleEvent extends LangEvent {

  const ChangeLocaleEvent(this.langType);

  final LanguageType langType;

  @override
  List<Object?> get props => [langType];

}
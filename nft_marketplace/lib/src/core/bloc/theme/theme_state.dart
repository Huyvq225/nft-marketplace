part of 'theme_bloc.dart';

@immutable
// ignore: must_be_immutable
class ThemeState extends Equatable {
  final ThemeData? themeData;
  late int unix;

  @override
  List<Object?> get props => [unix];

  @override
  bool get stringify => true;

  ThemeState({
    required this.themeData,
  }) {
    unix = DateTime.now().microsecondsSinceEpoch;
  }
}

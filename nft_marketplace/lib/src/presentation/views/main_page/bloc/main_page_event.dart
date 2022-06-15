part of 'main_page_bloc.dart';

abstract class MainPageEvent extends Equatable {
  const MainPageEvent();
}

class MainPageInitialEvent extends MainPageEvent {

  const MainPageInitialEvent();

  @override
  List<Object?> get props => [];

}
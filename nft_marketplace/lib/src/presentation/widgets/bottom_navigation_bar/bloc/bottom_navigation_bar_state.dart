part of 'bottom_navigation_bar_bloc.dart';

abstract class BottomNavigationBarState extends Equatable {
  const BottomNavigationBarState(this.currentTabIndex);

  final int currentTabIndex;
}

class BottomNavigationBarInitial extends BottomNavigationBarState {
  const BottomNavigationBarInitial(int currentTabIndex)
      : super(currentTabIndex);

  @override
  List<Object> get props => [currentTabIndex];
}

// ignore: must_be_immutable
class BottomNavBarLoadedState extends BottomNavigationBarState {
  const BottomNavBarLoadedState(int currentTabIndex) : super(currentTabIndex);

  @override
  List<Object> get props => [currentTabIndex];
}

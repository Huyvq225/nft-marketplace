part of 'bottom_navigation_bar_bloc.dart';

abstract class BottomNavigationBarEvent extends Equatable {
  const BottomNavigationBarEvent();
}

class BottomNavOnChangedEvent extends BottomNavigationBarEvent {
  const BottomNavOnChangedEvent(this.selectedIndex);

  final int selectedIndex;

  @override
  List<Object?> get props => [selectedIndex];
}

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_bar_event.dart';

part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarBloc
    extends Bloc<BottomNavigationBarEvent, BottomNavigationBarState> {
  BottomNavigationBarBloc() : super(const BottomNavigationBarInitial(0)) {
    on<BottomNavOnChangedEvent>(_tabIndexOnChanged);
  }

  Future<void> _tabIndexOnChanged(BottomNavOnChangedEvent event,
      Emitter<BottomNavigationBarState> emit) async {
    _currentTabIndex = event.selectedIndex;
    emit(BottomNavBarLoadedState(_currentTabIndex));
  }

  int _currentTabIndex = 0;
}

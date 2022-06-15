part of 'main_page_bloc.dart';

abstract class MainPageState extends Equatable {
  const MainPageState();
}

class MainPageInitial extends MainPageState {
  @override
  List<Object> get props => [];
}

class CollectionLoadedState extends MainPageState {

  const CollectionLoadedState(this.collections);

  final List<NftEntity> collections;
  @override
  List<Object> get props => [collections];
}
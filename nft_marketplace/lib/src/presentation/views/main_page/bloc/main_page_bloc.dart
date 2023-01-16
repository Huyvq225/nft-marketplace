import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nft_marketplace/src/core/params/collection_request.dart';
import 'package:nft_marketplace/src/domain/entities/nft.dart';
import 'package:nft_marketplace/src/domain/usecases/get_collections_usecase.dart';

part 'main_page_event.dart';

part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc(this._collectionsUseCase) : super(MainPageInitial()) {
    on<MainPageInitialEvent>(_initialBloc);
  }

  Future<void> _initialBloc(
      MainPageInitialEvent event, Emitter<MainPageState> emit) async {
    try{
      final _collectionsResult = await _collectionsUseCase.call(
          params: const CollectionRequestParams(
              chain: 'ethereum', pageSize: 10, include: 'all'));
      if (_collectionsResult.data != null &&
          _collectionsResult.data!.isNotEmpty) {
        _collections = _collectionsResult.data!;
        emit(CollectionLoadedState(_collections));
      }
    }  catch (error, stack) {
      print('error');
    }

  }

  late final GetCollectionsUseCase _collectionsUseCase;
  List<NftEntity> _collections = [];
}

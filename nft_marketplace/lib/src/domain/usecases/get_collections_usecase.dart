import 'package:nft_marketplace/src/core/params/collection_request.dart';
import 'package:nft_marketplace/src/core/resources/data_state.dart';
import 'package:nft_marketplace/src/core/usecases/usecase.dart';
import 'package:nft_marketplace/src/domain/entities/nft.dart';
import 'package:nft_marketplace/src/domain/repositories/collection_repository.dart';

class GetCollectionsUseCase
    extends UseCase<DataState<List<NftEntity>>, CollectionRequestParams> {
  GetCollectionsUseCase(this._collectionRepository);

  final CollectionRepository _collectionRepository;

  @override
  Future<DataState<List<NftEntity>>> call({CollectionRequestParams? params}) {
    return _collectionRepository.getAllCollection(params: params);
  }
}

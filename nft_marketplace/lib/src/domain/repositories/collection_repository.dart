import 'package:nft_marketplace/src/core/params/collection_request.dart';
import 'package:nft_marketplace/src/core/resources/data_state.dart';
import 'package:nft_marketplace/src/data/services/collection_services.dart';
import 'package:nft_marketplace/src/domain/entities/nft.dart';

abstract class CollectionRepository {
  //API method to get all list nft collection from defined chain
  Future<DataState<List<NftEntity>>> getAllCollection(
      {CollectionRequestParams? params});
}

class CollectionRepositoryImpl extends CollectionRepository {
  CollectionRepositoryImpl(this._collectionService);

  final CollectionService _collectionService;

  @override
  Future<DataState<List<NftEntity>>> getAllCollection(
      {CollectionRequestParams? params}) async {
    try {
      final _result = await _collectionService.getAllCollections(
          apiKey: params?.apiKey,
          chain: params?.chain,
          include: params?.include,
          pageSize: params?.pageSize);
      if (_result != null && _result.response == 'OK') {
        return DataSuccess(_result.nfts);
      } else {
        return const DataFailed('Something when wrong!');
      }
    } catch (e) {
      //handle error
      return const DataFailed('Something when wrong!');
    }
  }
}

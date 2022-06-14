
import 'package:nft_marketplace/src/data/models/collection_model.dart';

abstract class CollectionService {
  Future<CollectionModel?> getAllCollections(
      {String? apiKey, String? chain, String? include, int? pageSize});
}
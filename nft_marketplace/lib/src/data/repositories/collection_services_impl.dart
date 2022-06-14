import 'dart:convert';

import 'package:nft_marketplace/src/data/models/collection_model.dart';
import 'package:nft_marketplace/src/data/services/base_http_services.dart';
import 'package:nft_marketplace/src/data/services/collection_services.dart';

class CollectionServiceImpl implements CollectionService {
  CollectionServiceImpl(this._baseHTTPService);

  final BaseHTTPServices _baseHTTPService;

  @override
  Future<CollectionModel?> getAllCollections(
      {String? apiKey, String? chain, String? include, int? pageSize}) async {
    try {
      final _queryParameters = <String, dynamic>{
        r'chain': chain,
        r'include': include,
        r'page_size': pageSize
      };

      final _result = await _baseHTTPService.get(
          endpoint: '/v0/nfts', param: _queryParameters);

      if (_result != null && _result.statusCode == 200) {
        final Map<String, dynamic>? _response = json.decode(_result.body);
        return CollectionModel.fromJson(_response);
      }
      return null;
    } catch (e) {
      //handle error
      return null;
    }
  }
}

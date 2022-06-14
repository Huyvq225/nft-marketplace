import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nft_marketplace/src/data/models/collection_model.dart';
import 'package:nft_marketplace/src/data/repositories/collection_services_impl.dart';
import 'package:nft_marketplace/src/data/services/base_http_services.dart';

import '../../resources/resource_reader.dart';
import 'collection_services_test.mocks.dart';

@GenerateMocks([BaseHTTPServices])
void main() {
  late MockBaseHTTPServices baseHTTPServices;
  late CollectionServiceImpl collectionServiceImpl;

  final _queryParameters = <String, dynamic>{
    r'chain': null,
    r'include': null,
    r'page_size': null
  };

  setUp(() {
    baseHTTPServices = MockBaseHTTPServices();
    collectionServiceImpl = CollectionServiceImpl(baseHTTPServices);
  });

  void setUpMockHttpClientSuccess200() {
    when(baseHTTPServices.get(endpoint: '/v0/nfts', param: _queryParameters))
        .thenAnswer((_) async {
      return http.Response(resource('collection_model.json'), 200);
    });
  }

  test(
      'should calls base http service get method when collection service execute',
      () async {
    //arrange
    setUpMockHttpClientSuccess200();
    //act
    await collectionServiceImpl.getAllCollections();
    //assert
    verify(
      baseHTTPServices.get(endpoint: '/v0/nfts', param: _queryParameters),
    );
  });

  test(
      'should return Collection model when getting all collection successfully',
      () async {
    //arrange
    setUpMockHttpClientSuccess200();
    //act
    final _response = await collectionServiceImpl.getAllCollections();
    final _expectedResult =
        CollectionModel.fromJson(jsonDecode(resource('collection_model.json')));
    //assert
        expect(_response, _expectedResult);
  });
}

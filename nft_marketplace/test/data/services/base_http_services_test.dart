import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nft_marketplace/src/data/repositories/base_http_services_impl.dart';

import '../../resources/resource_reader.dart';
import 'base_http_services_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient client;
  late BaseHTTPServiceImpl baseHTTPServiceImpl;

  setUp(() {
    client = MockClient();
    baseHTTPServiceImpl = BaseHTTPServiceImpl(client);
  });

  void setUpMockHttpClientSuccess200() {
    when(
      client.get(
        Uri.https('api.nftport.xyz', '/v0/endpoint'),
        headers: {'Authorization': 'c3060e64-d85c-46dc-a22c-b809864e65f9'},
      ),
    ).thenAnswer((_) async =>
        http.Response(resource('sample_http_response_model.json'), 200));
  }

  void setUpMockHttpClientFailure400() {
    when(
      client.get(
        Uri.https('api.nftport.xyz', '/v0/endpoint'),
        headers: {'Authorization': 'c3060e64-d85c-46dc-a22c-b809864e65f9'},
      ),
    ).thenAnswer((_) async => http.Response('', 400));
  }

  test('should http client call get method when base http service execute',
      () async {
    //arrange
    setUpMockHttpClientSuccess200();

    //act
    baseHTTPServiceImpl.get(endpoint: '/v0/endpoint');

    //assert
    verify(
      client.get(
        Uri.https('api.nftport.xyz', '/v0/endpoint'),
        headers: {'Authorization': 'c3060e64-d85c-46dc-a22c-b809864e65f9'},
      ),
    );
  });

  test('should base http service get method is successful', () async {
    //arrange
    setUpMockHttpClientSuccess200();

    //act
    final _response = await baseHTTPServiceImpl.get(endpoint: '/v0/endpoint');

    //assert
    expect(_response?.statusCode, 200);
    expect(_response?.body, resource('sample_http_response_model.json'));
  });
}

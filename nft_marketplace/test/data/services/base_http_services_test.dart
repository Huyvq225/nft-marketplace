import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nft_marketplace/src/data/datasources/base_http_services_impl.dart';

class BaseHTTPServiceImplTest extends Mock implements BaseHTTPServiceImpl{}

void main() {

  late BaseHTTPServiceImplTest baseHTTPServiceImplTest;

  setUp(() {
    baseHTTPServiceImplTest = BaseHTTPServiceImplTest();
  });

  group('Base HTTP Service Test', () {

    //test get all collection service method
    test('when call getAllCollections should return collection model', () async {
      //arrange

      //act

      //assert

    });
    
  });
}
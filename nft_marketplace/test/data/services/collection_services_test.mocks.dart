// Mocks generated by Mockito 5.2.0 from annotations
// in nft_marketplace/test/data/services/collection_services_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:http/http.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:nft_marketplace/src/data/services/base_http_services.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [BaseHTTPServices].
///
/// See the documentation for Mockito's code generation for more information.
class MockBaseHTTPServices extends _i1.Mock implements _i2.BaseHTTPServices {
  MockBaseHTTPServices() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Response?> post(
          {String? endpoint = r'', Map<String, dynamic>? param}) =>
      (super.noSuchMethod(
          Invocation.method(#post, [], {#endpoint: endpoint, #param: param}),
          returnValue:
              Future<_i4.Response?>.value()) as _i3.Future<_i4.Response?>);
  @override
  _i3.Future<_i4.Response?> get(
          {String? endpoint = r'', Map<String, dynamic>? param}) =>
      (super.noSuchMethod(
              Invocation.method(#get, [], {#endpoint: endpoint, #param: param}),
              returnValue: Future<_i4.Response?>.value())
          as _i3.Future<_i4.Response?>);
}

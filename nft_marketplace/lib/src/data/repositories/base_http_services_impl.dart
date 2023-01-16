import 'package:nft_marketplace/src/core/utils/constants.dart';
import 'package:nft_marketplace/src/data/services/base_http_services.dart';
import 'package:http/http.dart' as http;
import 'package:sentry_flutter/sentry_flutter.dart';

class BaseHTTPServiceImpl implements BaseHTTPServices {
  BaseHTTPServiceImpl(this.client);

  late http.Client client;
  var sentryClient = SentryHttpClient(captureFailedRequests: true, networkTracing: true);


  final transaction = Sentry.startTransaction(
    'mobile_request',
    'request',
    bindToScope: true,
  );

  @override
  Future<http.Response?> get(
      {String endpoint = '', Map<String, dynamic>? param}) async {
    // final _uri = Uri.https(kBaseUrl, endpoint, param);
    // final _requestHeader = _prepareRequestHeader();
    // final _result = await client.get(_uri, headers: _requestHeader);
    // return _result;

    try {
      final _uri = Uri.https(kBaseUrl, endpoint, param);
      final _requestHeader = _prepareRequestHeader();
      var uriResponse = await sentryClient.get(_uri,
          headers: _requestHeader);
      return uriResponse;
    } catch(error, trace) {
      await Sentry.captureException(
        error,
        stackTrace: trace,
      );
    } finally {
      await transaction.finish();
    }
  }

  @override
  Future<http.Response?> post(
      {String? endpoint, Map<String, dynamic>? param}) async {
    // TODO: implement post
    throw UnimplementedError();
  }

  Map<String, String> _prepareRequestHeader() {
    final _requestHeader = {'Authorization': kApiKey};
    return _requestHeader;
  }
}

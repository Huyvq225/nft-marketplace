import 'package:nft_marketplace/src/core/utils/constants.dart';
import 'package:nft_marketplace/src/data/services/base_http_services.dart';
import 'package:http/http.dart' as http;

class BaseHTTPServiceImpl implements BaseHTTPServices {
  BaseHTTPServiceImpl(this.client);

  late http.Client client;

  @override
  Future<http.Response?> get(
      {String endpoint = '', Map<String, dynamic>? param}) async {

    final _uri = Uri.https(kBaseUrl, endpoint, param);
    final _requestHeader = _prepareRequestHeader();
    final _result = await client.get(_uri, headers: _requestHeader);
    return _result;
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

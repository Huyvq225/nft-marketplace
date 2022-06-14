import 'package:http/http.dart' as http;

abstract class BaseHTTPServices {
  Future<http.Response?> post(
      {String endpoint = '', Map<String, dynamic>? param});

  Future<http.Response?> get(
      {String endpoint = '', Map<String, dynamic>? param});
}

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class NetworkService {
  final String baseUrl;
  NetworkService({required this.baseUrl});

  final Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Accept-Language": "en",
  };

  // GET Request
  Future<Map<String, dynamic>> getRequest(String endpoint) async {
    return _httpRequest('GET', endpoint);
  }

  // POST Request
  Future<Map<String, dynamic>> postRequest(
      String endpoint, Map<String, dynamic> body) async {
    return _httpRequest('POST', endpoint, body: body);
  }

  // PUT Request
  Future<Map<String, dynamic>> putRequest(
      String endpoint, Map<String, dynamic> body) async {
    return _httpRequest('PUT', endpoint, body: body);
  }

  // DELETE Request
  Future<Map<String, dynamic>> deleteRequest(String endpoint) async {
    return _httpRequest('DELETE', endpoint);
  }

  Future<Map<String, dynamic>> _httpRequest(String method, String endpoint,
      {Map<String, dynamic>? body}) async {
    http.Response response;
    final uri = Uri.parse('$baseUrl/$endpoint');

    try {
      switch (method) {
        case 'GET':
          log('Get Request ==> $uri', name: 'Get Request');
          response = await http
              .get(
                uri,
                headers: headers,
              )
              .timeout(const Duration(seconds: 10));
          log('Get Response  ==> ${response.body} /n', name: 'Get Response');
          break;
        case 'POST':
          log('Post Request ==> $uri', name: 'Post Request');
          response = await http
              .post(uri, body: jsonEncode(body), headers: headers)
              .timeout(const Duration(seconds: 10));
          log('Post Response  ==> ${response.body} /n Request Body : ${jsonEncode(body)}',
              name: 'Post Response');
          break;
        case 'PUT':
          log('Put Request ==> $uri', name: 'Put Request');
          response = await http
              .put(uri, body: jsonEncode(body), headers: headers)
              .timeout(const Duration(seconds: 10));
          log('put Response  ==> ${response.body} /n', name: 'put Response');
          break;
        case 'DELETE':
          log('Delete Request ==> $uri', name: 'Delete Request');
          response = await http
              .delete(uri, headers: headers)
              .timeout(const Duration(seconds: 10));
          log('Delete Response  ==> ${response.body} /n',
              name: 'Delete Response');
          break;
        default:
          throw Exception('HTTP method not supported');
      }

      switch (response.statusCode) {
        case 200:
          if (response.body.isEmpty) {
            return jsonDecode(response.body);
          } else {
            try {
              return jsonDecode(response.body);
            } catch (e) {
              return {
                'success': false,
                'error': {'message': 'Failed to parse response'}
              };
            }
          }
        case 201:
          if (response.body.isEmpty) {
            return jsonDecode(response.body);
          } else {
            try {
              return jsonDecode(response.body);
            } catch (e) {
              return {
                'success': false,
                'error': {'message': 'Failed to parse response'}
              };
            }
          }
        case 400:
          return {
            'success': 'error',
            'error': {'message': 'Bad Request'}
          };
        case 404:
          return {
            'success': 'error',
            'error': {'message': 'Not Found'}
          };
        case 500:
          log(
            'Error happened',
            name: 'Error Happened',
          );
          return {
            'success': 'error',
            'error': {'message': 'Internal Server Error'}
          };
        default:
          return jsonDecode(response.body);
      }
    } on http.ClientException {
      return {
        'success': 'error',
        'error': {'message': 'Failed to connect to the server'}
      };
    } on FormatException {
      return {
        'success': 'error',
        'error': {'message': 'Invalid server response format'}
      };
    } on TimeoutException {
      return {
        'success': 'error',
        'error': {'message': 'Request timed out'}
      };
    } catch (error) {
      return {
        'success': 'error',
        'error': {'message': 'Unknown error: $error'}
      };
    }
  }
}

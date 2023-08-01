import 'dart:convert';

import 'dart:developer';

import 'package:devotion/util/Exceptions.dart';
import 'package:http/http.dart' as http;

class API {
  static String host = 'https://wetrek.zirite.tech/api';
  // String _rootURL = 'http://10.0.2.2:8000/api';
  late String _token;
//  static Uri base = Uri(
//    host: 'wetrek.wakabout.com.ng',
//    scheme: 'https',
//    path: '/api',
//    port: 80,
//  );
  // static Uri base = Uri.parse('http://10.0.2.2:8000/api');
  static Uri base = Uri.parse('https://wetrek.zirite.tech/api');

  API(token) {
    this._token = token;
  }

  static Map<String, String> headerWithoutToken() {
    return {'Accept': 'application/json', 'content-type': 'application/json'};
  }

  Map<String, String> headers() {
    return {
      'Authorization': 'Bearer ' + _token,
      'Accept': 'application/json',
      'content-type': 'application/json'
    };
  }

  static Map<String, dynamic> prepareResponse(http.Response httpResponse) {
    log(httpResponse.body.toString());
    if (httpResponse.statusCode == 200 || httpResponse.statusCode == 201) {
      return jsonDecode(httpResponse.body);
    } else if (httpResponse.statusCode == 422) {
      throw ValidationErrorException(errors: jsonDecode(httpResponse.body));
    } else if (httpResponse.statusCode == 401) {
      throw AuthenticationException();
    } else if (httpResponse.statusCode >= 400 &&
        httpResponse.statusCode < 500) {
      throw ClientErrorException();
    } else if (httpResponse.statusCode >= 500 &&
        httpResponse.statusCode < 600) {
      throw ServerErrorException();
    }
    throw UnknownException();
  }

  Future<Map<String, dynamic>> get(String url,
      {Map<String, dynamic>? params}) async {
    http.Response response = await http.get(
      API.base.replace(path: '/api' + url, queryParameters: params),
      headers: this.headers(),
    );
    log(response.body.toString(), name: 'network.category');
    return prepareResponse(response);
  }

  Future<Map<String, dynamic>> post(
      String url, Map<String, dynamic> data) async {
    String jsonData = jsonEncode(data);
    log(jsonData);
    Map<String, String> headers = this.headers();

    http.Response response = await http.post(
      API.base.replace(path: '/api' + url),
      body: jsonData,
      headers: headers,
    );
    return prepareResponse(response);
  }

  static Future<Map<String, dynamic>> postWithoutToken(
      String url, dynamic data) async {
    String jsonData = jsonEncode(data);
    Map<String, String> headers = API.headerWithoutToken();

    http.Response response = await http.post(
      API.base.replace(path: '/api' + url),
      body: jsonData,
      headers: headers,
    );
    return prepareResponse(response);
  }

  static Future<Map<String, dynamic>> getExternal(String fullUrl,
      {Map<String, String>? params}) async {
    final uri = Uri.parse(fullUrl);
    http.Response response = await http.get(
      uri.replace(queryParameters: params),
    );
    log(response.body.toString(), name: 'network.category');
    return prepareResponse(response);
  }

  Future<Map<String, dynamic>> put(String url, dynamic data) async {
    http.Response response = await http.put(
      API.base.replace(path: '/api' + url),
      body: jsonEncode(data),
      headers: this.headers(),
    );
    return prepareResponse(response);
  }

  Future<Map<String, dynamic>> delete(String url) async {
    http.Response response = await http.delete(
      API.base.replace(path: '/api' + url),
      headers: this.headers(),
    );
    return prepareResponse(response);
  }
}

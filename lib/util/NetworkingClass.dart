import 'dart:convert';
import 'dart:async';
import 'dart:developer';
import 'package:devotion/repositories/UserRepository.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

enum ResponseType {
  data,
  invalidated,
  error,
  unauthorized,
  notFound,
  unrecognized
}

class NetworkingClass {
  String _rootURL = 'http://10.0.2.2:8000/api';
  String token;
  bool isTokenGotten = false;

  NetworkingClass() {
    getToken();
  }

  Future<dynamic> getToken() async {
    var userRepo = UserRepository();
    this.token = await userRepo.getToken();
    this.isTokenGotten = true;
  }

  Map<String, String> headers() {
    if (token != '') {
      return {
        'Authorization': 'Bearer ' + token,
        'Accept': 'application/json',
        // 'content-type': 'application/json'
      };
    } else {
      return {'Accept': 'application/json', 'content-type': 'application/json'};
    }
  }

  Map<ResponseType, dynamic> prepareResponse(http.Response httpResponse) {
    log(httpResponse.body.toString());
    if (httpResponse.statusCode == 200 || httpResponse.statusCode == 201) {
      return {ResponseType.data: jsonDecode(httpResponse.body)};
    } else if (httpResponse.statusCode == 422) {
      return {ResponseType.invalidated: jsonDecode(httpResponse.body)};
    } else if (httpResponse.statusCode == 401) {
      return {ResponseType.invalidated: jsonDecode(httpResponse.body)};
    } else if (httpResponse.statusCode == 404) {
      return {ResponseType.notFound: jsonDecode(httpResponse.body)};
    }

    return {ResponseType.unrecognized: jsonDecode(httpResponse.body)};
  }

  Future<Map<ResponseType, dynamic>> get(String url) async {
    if (!isTokenGotten) await getToken();
    http.Response response =
        await http.get(_rootURL + url, headers: this.headers());
    developer.log(response.body.toString(), name: 'network.category');
    return prepareResponse(response);
  }

  Future<dynamic> post(String url, dynamic data) async {
    if (!isTokenGotten) await getToken();
    http.Response response = await http.post(
      _rootURL + url,
      body: jsonEncode(data),
      headers: this.headers(),
    );
    return prepareResponse(response);
  }

  Future<dynamic> put(String url, dynamic data) async {
    if (!isTokenGotten) await getToken();
    http.Response response = await http.put(
      _rootURL + url,
      body: jsonEncode(data),
      headers: this.headers(),
    );
    return prepareResponse(response);
  }

  Future<dynamic> delete(String url) async {
    if (!isTokenGotten) await getToken();
    http.Response response =
        await http.delete(_rootURL + url, headers: this.headers());
    return prepareResponse(response);
  }
}

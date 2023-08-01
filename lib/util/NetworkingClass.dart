import 'dart:convert';
import 'dart:async';
import 'dart:developer';
import 'package:devotion/repositories/UserRepository.dart';
import 'package:devotion/util/Constants.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

import 'Exceptions.dart';

class NetworkingClass {
  String _rootURL = 'https://devotion.wakabout.com.ng/api';
  // String _rootURL = 'http://10.0.2.2:8000/api';
  late final String token;
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
    if (token != null) {
      return {
        'Authorization': 'Bearer ' + token,
        'Accept': 'application/json',
        'content-type': 'application/json'
      };
    } else {
      return {'Accept': 'application/json', 'content-type': 'application/json'};
    }
  }

  Map<String, dynamic> prepareResponse(http.Response httpResponse) {
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

  Future<Map<String, dynamic>> get(String url) async {
    if (!isTokenGotten) await getToken();
    http.Response response =
        await http.get(_rootURL + url, headers: this.headers());
    developer.log(response.body.toString(), name: 'network.category');
    return prepareResponse(response);
  }

  Future<Map<String, dynamic>> post(String url, dynamic data) async {
    if (!isTokenGotten) await getToken();
    String jsonData = jsonEncode(data);
    Map<String, String> headers = this.headers();

    http.Response response = await http.post(
      _rootURL + url,
      body: jsonData,
      headers: headers,
    );
    return prepareResponse(response);
  }

  Future<Map<String, dynamic>> put(String url, dynamic data) async {
    if (!isTokenGotten) await getToken();
    http.Response response = await http.put(
      _rootURL + url,
      body: jsonEncode(data),
      headers: this.headers(),
    );
    return prepareResponse(response);
  }

  Future<Map<String, dynamic>> delete(String url) async {
    if (!isTokenGotten) await getToken();
    http.Response response =
        await http.delete(_rootURL + url, headers: this.headers());
    return prepareResponse(response);
  }
}

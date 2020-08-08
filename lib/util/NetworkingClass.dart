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

enum ResponseKey {
  type,
  data,
  error,
}

class NetworkingClass {
  String _rootURL = 'https://devotion.wakabout.com.ng/api';
  // String _rootURL = 'http://10.0.2.2:8000/api';
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

  Map<ResponseKey, dynamic> prepareResponse(http.Response httpResponse) {
    log(httpResponse.body.toString());
    if (httpResponse.statusCode == 200 || httpResponse.statusCode == 201) {
      return {
        ResponseKey.type: ResponseType.data,
        ResponseKey.data: jsonDecode(httpResponse.body)
      };
    } else if (httpResponse.statusCode == 422) {
      return {
        ResponseKey.type: ResponseType.invalidated,
        ResponseKey.error: jsonDecode(httpResponse.body)
      };
    } else if (httpResponse.statusCode == 401) {
      return {
        ResponseKey.type: ResponseType.unrecognized,
        ResponseKey.error: jsonDecode(httpResponse.body)
      };
    } else if (httpResponse.statusCode == 404) {
      return {
        ResponseKey.type: ResponseType.notFound,
        ResponseKey.error: jsonDecode(httpResponse.body)
      };
    }

    return {
      ResponseKey.type: ResponseType.unrecognized,
      ResponseKey.data: jsonDecode(httpResponse.body)
    };
  }

  Future<Map<ResponseKey, dynamic>> get(String url) async {
    if (!isTokenGotten) await getToken();
    http.Response response =
        await http.get(_rootURL + url, headers: this.headers());
    developer.log(response.body.toString(), name: 'network.category');
    return prepareResponse(response);
  }

  Future<dynamic> post(String url, dynamic data) async {
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

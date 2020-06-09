import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;


class NetworkingClass {
  final String _rootURL = '127.0.0.1:8000';
  String token = '';

  NetworkingClass(this.token);

  Map<String, String> headers() {
    if (token != '') {
      return {'Authorization': 'Bearer ' + token, 'Accept': 'application/json'};
    } else {
      return {'Accept': 'application/json'};
    }
  }

  Future<dynamic> get(String url) async {
    http.Response response =
        await http.get(_rootURL + url, headers: this.headers());
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      return [];
    }
  }

  Future<dynamic> post(String url, dynamic data) async {
    http.Response response =
        await http.post(_rootURL + url, body: data, headers: this.headers());
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      return [];
    }
  }

  Future<dynamic> put(String url, dynamic data) async {
    http.Response response =
        await http.put(_rootURL + url, body: data, headers: this.headers());
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      return [];
    }
  }

  Future<dynamic> delete(String url) async {
    http.Response response =
        await http.delete(_rootURL + url, headers: this.headers());
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body).data;
      return data;
    } else {
      return [];
    }
  }
}

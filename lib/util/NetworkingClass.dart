import 'dart:convert';
import 'dart:async';
import 'package:devotion/repositories/UserRepository.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;


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
      return {'Authorization': 'Bearer ' + token, 'Accept': 'application/json'};
    } else {
      return {'Accept': 'application/json'};
    }
  }

  Future<dynamic> get(String url) async {
    if (!isTokenGotten) await getToken();
    http.Response response =
        await http.get(_rootURL + url, headers: this.headers());
          developer.log(response.body.toString(), name: 'network.category');

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      return [];
    }
  }

  Future<dynamic> post(String url, dynamic data) async {
    if (!isTokenGotten) await getToken();
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
    if (!isTokenGotten) await getToken();
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
    if (!isTokenGotten) await getToken();
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

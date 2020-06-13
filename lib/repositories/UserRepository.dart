import 'dart:convert';

import 'package:devotion/models/LoginData.dart';
import 'package:devotion/util/NetworkingClass.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class UserRepository {
  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    var server = NetworkingClass(token: '');
    var res =
        await server.post('/login', {'email': username, 'password': password});
    LoginData response = LoginData.fromJson(jsonDecode(res));
    if (response.success == true) {
      await persistToken(response.token);
      return response.token;
    }
    return null;
  }

  Future<SharedPreferences> getSharedPreferences(){
  return  SharedPreferences.getInstance();
  }

  Future<void> deleteToken() async {
    final SharedPreferences prefs = await getSharedPreferences();
    await prefs.remove('token');
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain

    final SharedPreferences prefs = await getSharedPreferences();
    await prefs.setString("token", token);
    return;
  }

  Future<bool> hasToken() async {
    final SharedPreferences prefs = await getSharedPreferences();
    bool _hasToken = prefs.containsKey('token');
    return _hasToken;
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await getSharedPreferences();
    return prefs.getString('token');
  }
}

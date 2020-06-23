import 'dart:async';

import 'package:devotion/models/LoginData.dart';
import 'package:devotion/util/NetworkingClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserRepository {
  final FlutterSecureStorage storage = FlutterSecureStorage();

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    NetworkingClass server = NetworkingClass();
    Map<ResponseType, dynamic> res =
        await server.post('/login', {'email': username, 'password': password});

    if (res.containsKey(ResponseType.data)) {
      LoginData data = LoginData.fromJson(res[ResponseType.data]);
      //this is being done in the authentication bloc
      //await persistToken(response.token);
      return data.token;
    }
    return null;
  }

  Future<void> deleteToken() async {
    await storage.delete(key: 'token');
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await storage.write(key: 'token', value: token);
    return;
  }

  Future<bool> hasToken() async {
    bool _hasToken = await storage.read(key: 'token') != null;
    return _hasToken;
  }

  Future<String> getToken() async {
    return await storage.read(key: 'token');
  }
}

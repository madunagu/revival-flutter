import 'dart:async';
import 'dart:convert';

import 'package:devotion/models/login_data.dart';
import 'package:devotion/models/user.dart';
import 'package:devotion/util/NetworkingClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserRepository {
  final FlutterSecureStorage storage = FlutterSecureStorage();

  Future<LoginData> authenticate({
    required String username,
    required String password,
  }) async {
    NetworkingClass server = NetworkingClass();
    final Map<String, dynamic> res =
        await server.post('/login', {'email': username, 'password': password});

    LoginData data = LoginData.fromJson(res);
    return data;
  }

  Future<void> deleteToken() async {
    await storage.delete(key: 'token');
    return;
  }

  Future<void> saveUser(String user) async {
    await storage.write(key: 'user', value: user);
    return;
  }

  Future<User> getUser() async {
    String userStr = await storage.read(key: 'user');
    return User.fromJson(jsonDecode(userStr));
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

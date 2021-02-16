import 'dart:async';

import 'package:devotion/models/LoginData.dart';
import 'package:devotion/util/NetworkingClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class EventRepository {
  final FlutterSecureStorage storage = FlutterSecureStorage();

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    NetworkingClass server = NetworkingClass();
    final Map<String, dynamic> res =
        await server.post('/login', {'email': username, 'password': password});

    LoginData data = LoginData.fromJson(res);
    return data.token;
  }
}

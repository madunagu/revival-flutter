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
    final Map<ResponseKey, dynamic> res =
        await server.post('/login', {'email': username, 'password': password});

    if (res[ResponseKey.type] == ResponseType.data) {
      LoginData data = LoginData.fromJson(res[ResponseKey.data]);
      //this is being done in the authentication bloc
      //await persistToken(response.token);
      return data.token;
    }
    return null;
  }
}

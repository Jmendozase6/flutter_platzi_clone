import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';

class ClientAppwrite extends ChangeNotifier {
  //
  Client client = Client();
  late Account account;

  ClientAppwrite() {
    _init();
  }

  void _init() {
    account = Account(client);
    client
        .setEndpoint('http://192.168.1.14:80/v1')
        .setProject('63decff1ba55ee44ef0f');
    log('Se supone que ya entró xd');
  }

  createAccount(String name, String email, String password) async {
    try {
      final result = await account.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: name,
      );
      debugPrint('$result');
    } catch (error) {
      debugPrint('$error');
    }
  }

  login(String email, String password) async {
    try {
      final result = await account.createEmailSession(
        email: email,
        password: password,
      );
      debugPrint('$result');
    } catch (error) {
      debugPrint('$error');
    }
  }
}

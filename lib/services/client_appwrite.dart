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
  }

  Future<bool> createAccount(String name, String email, String password) async {
    try {
      final result = await account.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: name,
      );
      debugPrint('$result');
      return result.status;
    } catch (error) {
      debugPrint('$error');
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      final result = await account.createEmailSession(
        email: email,
        password: password,
      );
      debugPrint('$result');
      return result.current;
    } catch (error) {
      debugPrint('$error');
      return false;
    }
  }

  loginAnonymous() async {
    try {
      final user = await account.createAnonymousSession();
      log(user.ip);
    } catch (error) {
      debugPrint('$error');
    }
  }

  logOut() async {
    await account.deleteSessions();
  }
}

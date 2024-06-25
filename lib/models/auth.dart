import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/exeptions/exeptions_auth.dart';
import 'package:shop/utils/constants.dart';

class Auth with ChangeNotifier {
  String? _token;
  String? _email;
  String? _userId;
  DateTime? _expiryDate;

  bool get isAuth {
    final isValid = _expiryDate?.isAfter(DateTime.now()) ?? false;
    return _token != null && isValid;
  }

  String? get token => isAuth ? _token : null;
  String? get email => isAuth ? _email : null;
  String? get userId => isAuth ? _userId : null;

  Future<void> showDialogError(BuildContext context, String message) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Ocorreu um erro"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text("Fechar"),
          ),
        ],
      ),
    );
  }

  Future<void> auth(String email, String password, String url) async {
    final respose = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        "email": email,
        "password": password,
        "returnSecureToken": true,
      }),
    );

    if (respose.statusCode > 400) {
      throw Exception("Verefique a conexão com a internet");
    }

    final resposeData = jsonDecode(respose.body);
    if (resposeData['error'] != null) {
      throw ExeptionsAuth(resposeData['error']['message']);
    }

    _token = resposeData['idToken'];
    _email = resposeData['email'];
    _userId = resposeData['localId'];

    _expiryDate = DateTime
        .now()
        .add(Duration(seconds: int.parse(resposeData['expiresIn'])));

    notifyListeners();
  }

  Future<void> signUp(String email, String password) async {
    return auth(email, password, Constants().urlAuthSingUp);
  }

  Future<void> signIn(String email, String password) async {
    return auth(email, password, Constants().urlAuthSingIn);
  }

  void logout() {
    _token = null;
    _email = null;
    _userId = null;
    _expiryDate = null;
    notifyListeners();
  }
}



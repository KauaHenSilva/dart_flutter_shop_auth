import 'package:flutter/material.dart';

class Constants {
  final _url = const String.fromEnvironment('url_base');
  final _urlAuthSingUP = const String.fromEnvironment('url_auth_sign_up');
  final _urlAuthSingIN = const String.fromEnvironment('url_auth_sign_in');

  String get urlProducts {
    debugPrint(_url);
    return '$_url/products';
  }
  String get urlCart => '$_url/cart';
  String get urlOrders => '$_url/orders';

  String get urlAuthSingUp => _urlAuthSingUP;
  String get urlAuthSingIn => _urlAuthSingIN;
}

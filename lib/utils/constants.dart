
class Constants {
  final _urlDataBase = const String.fromEnvironment('url_base');
  final _urlAuthSingUP = const String.fromEnvironment('url_auth_sign_up');
  final _urlAuthSingIN = const String.fromEnvironment('url_auth_sign_in');

  String get urlProducts => '$_urlDataBase/products';
  String get urlCart => '$_urlDataBase/cart';
  String get urlOrders => '$_urlDataBase/orders';
  String get urlFavorites => '$_urlDataBase/userFavorites';

  String get urlAuthSingUp => _urlAuthSingUP;
  String get urlAuthSingIn => _urlAuthSingIN;
}

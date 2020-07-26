import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class LocaleBase {
  Map<String, dynamic> _data;
  String _path;
  Future<void> load(String path) async {
    _path = path;
    final strJson = await rootBundle.loadString(path);
    _data = jsonDecode(strJson);
    initAll();
  }
  
  Map<String, String> getData(String group) {
    return Map<String, String>.from(_data[group]);
  }

  String getPath() => _path;

  Localecommon _common;
  Localecommon get common => _common;

  void initAll() {
    _common = Localecommon(Map<String, String>.from(_data['common']));
  }
}

class Localecommon {
  final Map<String, String> _data;
  Localecommon(this._data);

  String get mobileNumber => _data["mobileNumber"];
  String get password => _data["password"];
  String get forgotPassword => _data["forgotPassword"];
  String get register => _data["register"];
  String get inputPhoneNumber => _data["inputPhoneNumber"];
  String get sendRequest => _data["sendRequest"];
  String get confirm => _data["confirm"];
  String get newPassword => _data["newPassword"];
  String get confirmPassword => _data["confirmPassword"];
  String get set => _data["set"];
  String get email => _data["email"];
  String get invitationCode => _data["invitationCode"];
  String get activate => _data["activate"];
  String get home => _data["home"];
  String get cart => _data["cart"];
  String get profile => _data["profile"];
  String get addToCart => _data["addToCart"];
  String get contactUs => _data["contactUs"];
  String get changeLanguage => _data["changeLanguage"];
  String get settings => _data["settings"];
  String get language => _data["language"];
  String get logOut => _data["logOut"];
  String get delivery => _data["delivery"];
  String get payment => _data["payment"];
  String get specialRequst => _data["specialRequst"];
  String get total => _data["total"];
  String get egyptianPound => _data["egyptianPound"];
  String get deliveryFees => _data["deliveryFees"];
  String get subtotal => _data["subtotal"];
  String get updateLanguage => _data["updateLanguage"];
  String get update => _data["update"];
  String get saveEdits => _data["saveEdits"];
  String get add => _data["add"];
  String get executeOrder => _data["executeOrder"];
  String get thanks => _data["thanks"];
  String get name => _data["name"];
  String get signUp => _data["signUp"];
}

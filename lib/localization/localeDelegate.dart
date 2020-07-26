import 'package:flutter/material.dart';
import '../generated/locale_base.dart';
///using this tool in vscode
/// https://marketplace.visualstudio.com/items?itemName=apin.flutter-internationalize
class LocDelegate extends LocalizationsDelegate<LocaleBase> {
  const LocDelegate();
  final idMap = const {'en': 'locales/EN_US.json', 'ar': 'locales/AR_EG.json'};

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<LocaleBase> load(Locale locale) async {
    var lang = 'en';
    if (isSupported(locale)) lang = locale.languageCode;
    final loc = LocaleBase();
    await loc.load(idMap[lang]);
    return loc;
  }

  static LocaleBase of(BuildContext context) {
    return Localizations.of<LocaleBase>(context, LocaleBase);
  }
  @override
  bool shouldReload(LocDelegate old) => false;
}
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ztour_mobile/Widgets/Setting/demo_localization.dart';

String getTranslated(BuildContext context, String key) {
  return DemoLocalizations.of(context).getTranslatedValue(key);
}

//language code
const String ENGLISH = 'en';
const String MELAYU = 'ms';

//language Code
const String LANGUAGE_CODE = 'languageCode';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();

  await _prefs.setString(LANGUAGE_CODE, languageCode);

  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  Locale _temp;
  switch (languageCode) {
    case ENGLISH:
      _temp = Locale(languageCode, 'US');
      break;
    case MELAYU:
      _temp = Locale(languageCode, 'MY');
      break;
    default:
      _temp = Locale(ENGLISH, 'US');
  }

  return _temp;
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LANGUAGE_CODE) ?? 'en';
  return _locale(languageCode);
}

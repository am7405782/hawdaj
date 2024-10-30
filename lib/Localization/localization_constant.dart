import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hawdaj/Localization/language_localization.dart';
import 'package:hawdaj/constants/keys_values.dart';
import 'package:hawdaj/constants/preference_utility.dart';

String getTranslated(BuildContext context, String key) {
  var value = LanguageLocalization.of(context)!.getTranslateValue(key);
  return value.toString();
}

const String english = "en";
const String arabic = "ar";
const String russian = "ru";
const String chinese = "zh";

Future<Locale> setLocale(String languageCode) async {
  SharedPreferenceUtil.putString(PrefKey.currentLanguageCode, languageCode);
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case english:
      return Locale(languageCode, 'US');
    case arabic:
      return Locale(languageCode, 'AE');
    case russian:
      return Locale(languageCode, 'RU');
    case chinese:
      return Locale(languageCode, 'CN');
    default:
      return const Locale(english, 'US');
  }
}

Future<Locale> getLocale() async {
  String languageCode =
      SharedPreferenceUtil.getString(PrefKey.currentLanguageCode);
  return _locale(languageCode);
}

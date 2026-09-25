// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en_IN = {
  "i_agree": {
    "text": "By Continuing, I agree with the ",
    "terms": "Terms of Service ",
    "policy": "Privacy Policy ",
    "money_back": "Money-Back Policy"
  }
};
static const Map<String,dynamic> en_US = {
  "i_agree": {
    "text": "By continuing, I agree with the ",
    "terms": "Terms of Service ",
    "policy": "Privacy Policy ",
    "money_back": "Money-Back Policy"
  }
};
static const Map<String,dynamic> hi_IN = {
  "i_agree": {
    "text": "जारी रखते हुए, मैं इससे सहमत हूं ",
    "terms": "Terms of Service ",
    "policy": "Privacy Policy ",
    "money_back": "Money-Back Policy"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en_IN": en_IN, "en_US": en_US, "hi_IN": hi_IN};
}

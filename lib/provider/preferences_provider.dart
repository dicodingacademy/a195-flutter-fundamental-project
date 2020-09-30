import 'package:dicoding_news_app/common/styles.dart';
import 'package:dicoding_news_app/data/preferences/preferences_helper.dart';
import 'package:flutter/material.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;

  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;

  ThemeData get themeData => _isDarkTheme ? darkTheme : lightTheme;

  PreferencesProvider({@required this.preferencesHelper}) {
    getTheme();
  }

  void getTheme() async {
    _isDarkTheme = await preferencesHelper.isDarkTheme;
    notifyListeners();
  }

  void enableDarkTheme(bool value) {
    preferencesHelper.setDarkTheme(value);
    getTheme();
    notifyListeners();
  }
}

import 'dart:developer';

import 'package:airbnb_app/themes/dark_theme.dart';
import 'package:airbnb_app/themes/llight_theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = ChangeNotifierProvider<ThemeNotifier>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends ChangeNotifier {
  ThemeData _themeData = darkTheme;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  void toggleTheme() {
    log('toggling theme');
    themeData = _themeData == lightTheme ? darkTheme : lightTheme;

    notifyListeners();
  }
}

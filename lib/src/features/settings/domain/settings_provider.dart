import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends StateNotifier<bool> {
  ThemeNotifier() : super(false);
  void toggleTheme() {
    state = !state;
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, bool>((ref) {
  return ThemeNotifier();
});

final appThemeProvider = Provider<ThemeData>((ref) {
  final isDarkMode = ref.watch(themeProvider);
  return isDarkMode ? ThemeData.dark() : ThemeData.light();
});

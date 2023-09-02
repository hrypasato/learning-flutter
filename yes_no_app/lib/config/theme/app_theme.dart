import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF49149F);

const List<Color> _colorThemes = [
  _customColor,
  Colors.pink,
  Colors.greenAccent,
  Colors.redAccent,
  Colors.yellowAccent,
  Colors.deepOrange
];

class AppTheme {
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0,
  }) : assert(_isRageColor(selectedColor),
            'Colors must be between 0 and ${_colorThemes.length}');

  ThemeData themeData() {
    return ThemeData(
      useMaterial3: true,
      //brightness: Brightness.dark,
    );
  }

  static _isRageColor(int selectedColor) {
    return selectedColor >= 0 && selectedColor <= _colorThemes.length - 1;
  }
}

import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.greenAccent,
  Colors.deepPurple,
  Colors.tealAccent,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'Selected color must be greather than 0'),
        assert(selectedColor < colorList.length,
            'Selected color must be grater then array');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: const AppBarTheme(centerTitle: false),
      );
}

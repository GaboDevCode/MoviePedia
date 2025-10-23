import 'package:flutter/material.dart';

const ColorList = <Color>[ Colors.black, Colors.blueAccent];

class AppTheme {
  final int indexColorSelection = 0;
  final bool isDarkMode;

  AppTheme({indexColorSelection = 0, this.isDarkMode = false})
    : assert(indexColorSelection >= 0, 'Color seleccionado'),
      assert(
        indexColorSelection < ColorList.length ||
            indexColorSelection > ColorList.length,
        'Color fuera de rango',
      );

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: ColorList[indexColorSelection],
  );
}

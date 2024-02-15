import 'package:flutter/material.dart';

class AppColors {
  static const MaterialColor primaryColor = MaterialColor(
    0xFFeb1e3a,
    <int, Color>{
      50: Color(0xFFfde9eb),
      100: Color(0xFFf9b9c2),
      200: Color(0xFFf698a4),
      300: Color(0xFFf2687b),
      400: Color(0xFFef4b61),
      500: Color(0xFFeb1e3a),
      600: Color(0xFFd61b35),
      700: Color(0xFFa71529),
      800: Color(0xFF811120),
      900: Color(0xFF630d18),
    },
  );

  static const MaterialColor secondaryColor = MaterialColor(
    0xFF0e0e96,
    <int, Color>{
      50: Color(0xFFe7e7f5),
      100: Color(0xFFb4b4de),
      200: Color(0xFF9090cf),
      300: Color(0xFF5e5eb9),
      400: Color(0xFF3e3eab),
      500: Color(0xFF0e0e96),
      600: Color(0xFF0d0d89),
      700: Color(0xFF0a0a6b),
      800: Color(0xFF080853),
      900: Color(0xFF06063f),
    },
  );

  static const MaterialColor grayColor = MaterialColor(
    0xFF667085,
    <int, Color>{
      50: Color(0xFFf0f1f3),
      100: Color(0xFFd0d3d9),
      200: Color(0xFFb9bdc7),
      300: Color(0xFF989fad),
      400: Color(0xFF858d9d),
      500: Color(0xFF667085),
      600: Color(0xFF5d6679),
      700: Color(0xFF48505e),
      800: Color(0xFF383e49),
      900: Color(0xFF2b2f38),
    },
  );

  static const MaterialColor textColorSwatch = MaterialColor(
    0xFF101828,
    <int, Color>{
      50: Color(0xFFe7e8ea),
      300: Color(0xFF5f646f),
      400: Color(0xFF404653),
      500: Color(0xFF101828),
      900: Color(0xFF070a11),
    },
  );

  static const MaterialColor successColor = MaterialColor(
    0xFF12b76a,
    <int, Color>{
      50: Color(0xFFe7f8f0),
      500: Color(0xFF12b76a),
    },
  );

  static const MaterialColor warningColor = MaterialColor(
    0xFFf79009,
    <int, Color>{
      50: Color(0xFFfef4e6),
      500: Color(0xFFf79009),
    },
  );

  static const MaterialColor errorColor = MaterialColor(
    0xFFf04438,
    <int, Color>{
      50: Color(0xFFfeeceb),
      500: Color(0xFFf04438),
    },
  );

  static const white = Color(0xffffffff);
  static const black = Color(0xff000000);

  static const shimmerBaseColor = Color(0xFFD9D9D9);
  static const shimmerHighlightColor = Color(0xFFF6F6F6);
}

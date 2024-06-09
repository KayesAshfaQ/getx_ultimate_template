import 'package:flutter/material.dart';

class AppColors {
  // primary colors
  static const MaterialColor primary = MaterialColor(
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

  static const MaterialColor secondary = MaterialColor(
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

  static const white = Color(0xffffffff);
  static const black = Color(0xff000000);

  static const MaterialColor gray = MaterialColor(
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

  // text colors
  static const primaryText = Color(0xFF101828);
  static const secondaryText = Color(0xFF667085);

  static const MaterialColor text = MaterialColor(
    0xFF101828,
    <int, Color>{
      50: Color(0xFFe7e8ea),
      300: Color(0xFF5f646f),
      400: Color(0xFF404653),
      500: Color(0xFF101828),
      900: Color(0xFF070a11),
    },
  );

  // background colors
  static const background = Color(0xFFf9f9f9);
  static const scaffoldBackground = Color(0xFFf0f1f3);

  // component colors
  static const card = Color(0xFFFFFFFF);
  static const divider = Color(0xFFe7e8ea);

  static const iconDark = Color(0xFF5f646f);
  static const iconLight = Color(0xFFe7e8ea);

  // status colors
  static const MaterialColor success = MaterialColor(
    0xFF12b76a,
    <int, Color>{
      50: Color(0xFFe7f8f0),
      500: Color(0xFF12b76a),
    },
  );

  static const MaterialColor warning = MaterialColor(
    0xFFf79009,
    <int, Color>{
      50: Color(0xFFfef4e6),
      500: Color(0xFFf79009),
    },
  );

  static const MaterialColor error = MaterialColor(
    0xFFf04438,
    <int, Color>{
      50: Color(0xFFfeeceb),
      500: Color(0xFFf04438),
    },
  );

  // other colors
  static const shimmerBase = Color(0xFFD9D9D9);
  static const shimmerHighlight = Color(0xFFF6F6F6);

  static const transparent = Color(0x00000000);
  static const transparentWhite = Color(0x80ffffff);
  static const transparentBlack = Color(0x80000000);
  static const transparentGray = Color(0x80999999);
  static const transparentPrimary = Color(0x80eb1e3a);

  static const shadow = Color(0x33000000);
  static const shadowLight = Color(0x22000000);
  static const shadowDark = Color(0x66000000);

  static const overlay = Color(0x66000000);
  static const overlayLight = Color(0x22000000);
  static const overlayDark = Color(0x99000000);
}

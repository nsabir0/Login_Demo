// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class MyTheme {
  /*configurable colors stars*/
  static Color accent_color = const Color.fromRGBO(36, 33, 36, 1);
  static Color accent_color_2 = const Color.fromRGBO(230, 46, 4, 1);
  static Color soft_accent_color = const Color.fromRGBO(153, 153, 153, 1);
  static Color soft_accent_color_2 = const Color.fromRGBO(247, 189, 168, 1);
  static Color splash_login_screen_color = const Color.fromRGBO(
      39, 38, 43, 1); // if not sure , use the same color as accent color
  static Color splash_login_background_logo_color = const Color.fromRGBO(
      225, 225, 225, .1); // if not sure , use the same color as accent color
  /*configurable colors ends*/

  /*If you are not a developer, do not change the bottom colors*/
  static Color white = const Color.fromRGBO(255, 255, 255, 1);
  static Color light_grey = const Color.fromRGBO(239, 239, 239, 1);
  static Color dark_grey = const Color.fromRGBO(112, 112, 112, 1);
  static Color medium_grey = const Color.fromRGBO(132, 132, 132, 1);
  static Color grey_153 = const Color.fromRGBO(153, 153, 153, 1);
  static Color font_grey = const Color.fromRGBO(73, 73, 73, 1);
  static Color textfield_grey = const Color.fromRGBO(209, 209, 209, 1);
  static Color shimmer_base = Colors.grey.shade50;
  static Color shimmer_highlighted = Colors.grey.shade200;

  static Color red = const Color.fromRGBO(237, 41, 57, 1);
  static Color lime = const Color.fromRGBO(130, 180, 64, 1);
  static Color orange = const Color.fromRGBO(255, 111, 0, 1);
  static Color blue = const Color.fromRGBO(0, 132, 180, 1);
  static Color golden = const Color.fromRGBO(255, 171, 0, 1);

  static Color red_disabled = const Color.fromRGBO(237, 41, 57, .5);
  static Color lime_disabled = const Color.fromRGBO(130, 180, 64, .5);
  static Color orange_disabled = const Color.fromRGBO(255, 111, 0, .5);
  static Color blue_disabled = const Color.fromRGBO(0, 132, 180, .5);
  static Color golden_disabled = const Color.fromRGBO(255, 171, 0, .5);

//testing shimmer
/*static Color shimmer_base = Colors.redAccent;
  static Color shimmer_highlighted = Colors.yellow;*/
}

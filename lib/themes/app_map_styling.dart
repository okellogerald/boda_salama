import 'package:flutter/services.dart';

class AppMapStyling {
  static var _darkStyle = '';
  static var _retroStyle = '';

  static Future<void> loadMapStyles() async {
    await rootBundle.loadString('assets/mapStyles/dark.txt').then((string) {
      _darkStyle = string;
    });
    await rootBundle.loadString('assets/mapStyles/retro.txt').then((string) {
      _retroStyle = string;
    });
  }

  static String get getDarkStyle => _darkStyle;
  static String get getRetroStyle => _retroStyle;
}

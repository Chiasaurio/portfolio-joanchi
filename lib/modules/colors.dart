import 'dart:ui';

class ColorAppConfig {
  Color primary = const Color(0xFF3e5151);
  Color secondary = const Color(0xFFdecba4);
  Color background = const Color.fromARGB(255, 247, 241, 241);
}

class _ColorsApp {
  static ColorAppConfig get getColor {
    return ColorAppConfig();
  }
}

ColorAppConfig get getColor => _ColorsApp.getColor;

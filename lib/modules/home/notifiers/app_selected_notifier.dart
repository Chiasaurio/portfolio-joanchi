part of '../_lib.dart';

/* class AppSelectedStream {
  static StreamController<AppModel>? _appSelectedStream;
  static Stream<AppModel>? get appSelectedStream => _appSelectedStream?.stream;

  static void update(AppModel data) {
    _appSelectedStream?.add(data);
  }

  static Future<void> init() async {
    _appSelectedStream ??= StreamController.broadcast();
  }

  static Future<void> dispose() async {
    _appSelectedStream?.close();
    _appSelectedStream = null;
  }
}
 */
part of '../_lib.dart';

class AppSelectedController {
  static VideoPlayerNotifier? notifier;

  static init() {
    notifier = VideoPlayerNotifier();
  }

  static dispose() {
    notifier!.dispose();
  }

  static selectApp(AppModel app) async {
    notifier!.changeApp(null);
    await Future.delayed(const Duration(milliseconds: 500));
    notifier!.changeApp(app);
  }
}

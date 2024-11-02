part of '../_lib.dart';

class VideoPlayerNotifier extends ChangeNotifier {
  AppModel? _appSelected;

  AppModel? get appSelected => _appSelected;

  changeApp(AppModel app) async {
    _appSelected = app;
    notifyListeners();
  }

  @override
  dispose() {
    super.dispose();
    _appSelected = null;
    notifyListeners();
  }
}

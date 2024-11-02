part of '../_lib.dart';

class VideoPlayerNotifier extends ChangeNotifier {
  VideoPlayerController? _videoPlayerController;

  init(String asset) {
    _videoPlayerController = VideoPlayerController.asset(asset)..initialize();
    notifyListeners();
  }

  changeAsset(String asset) async {
    await _videoPlayerController!.dispose();
    _videoPlayerController = null;
    _videoPlayerController = VideoPlayerController.asset(asset)..initialize();

    notifyListeners();
  }

  @override
  dispose() {
    super.dispose();
    _videoPlayerController!.dispose();
    _videoPlayerController = null;
    notifyListeners();
  }
}

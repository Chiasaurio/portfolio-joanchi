part of '_lib.dart';

class VideoPlayerAtom extends StatelessWidget {
  final double width;
  final double height;
  final String asset;
  final VideoPlayerController controller;
  final Function() onPlay;
  final Function() onPause;
  VideoPlayerAtom({
    super.key,
    this.width = 500,
    this.height = 500,
    required this.asset,
    required this.controller,
    required this.onPlay,
    required this.onPause,
  });

  final ValueNotifier<bool> _isPlaying = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return _videoContainer();
  }

  Widget _videoContainer() {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          // width: width,
          // height: height,
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: _player(),
          ),
        ),
        _playButton(),
      ],
    );
  }

  Widget _player() {
    /*  final chewieController = ChewieController(
      videoPlayerController: controller,
      autoPlay: true,
      looping: true,
    );

    final playerWidget = Chewie(
      controller: chewieController,
    );

    return playerWidget; */
    return VideoPlayer(controller);
  }

  Widget _playButton() {
    return ValueListenableBuilder(
      valueListenable: _isPlaying,
      builder: (_, value, child) {
        if (_isPlaying.value) return _pause();
        return _play();
      },
    );
  }

  Widget _play() {
    return IconButton(
      onPressed: () {
        _isPlaying.value = true;
        onPlay();
      },
      icon: const Icon(Icons.play_arrow),
    );
  }

  Widget _pause() {
    return OnHoverHiddenAtom(
      child: IconButton(
        onPressed: () {
          _isPlaying.value = false;
          onPause();
        },
        icon: const Icon(Icons.pause),
      ),
    );
  }
}

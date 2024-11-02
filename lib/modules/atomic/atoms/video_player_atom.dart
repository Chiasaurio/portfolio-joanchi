part of '_lib.dart';

class VideoPlayerAtom extends StatelessWidget {
  final double width;
  final double height;
  final String asset;
  final VideoPlayerController controller;
  final Function() onPlay;
  final Function() onPause;
  const VideoPlayerAtom({
    super.key,
    this.width = 500,
    this.height = 500,
    required this.asset,
    required this.controller,
    required this.onPlay,
    required this.onPause,
  });

  @override
  Widget build(BuildContext context) {
    return _videoContainer();
  }

  Widget _videoContainer() {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: width,
          height: height,
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: VideoPlayer(controller),
          ),
        ),
        _playButton(),
      ],
    );
  }

  Widget _playButton() {
    if (controller.value.isPlaying) return _pause();
    return _play();
  }

  Widget _play() {
    return IconButton(
      onPressed: () => onPlay(),
      icon: const Icon(Icons.play_arrow),
    );
  }

  Widget _pause() {
    return OnHoverHiddenAtom(
      child: IconButton(
        onPressed: () => onPause(),
        icon: const Icon(Icons.pause),
      ),
    );
  }
}

part of '_lib.dart';

class VideoPlayerAtom extends StatefulWidget {
  final double width;
  final double height;
  final String asset;
  const VideoPlayerAtom({
    super.key,
    this.width = 500,
    this.height = 500,
    required this.asset,
  });

  @override
  State<VideoPlayerAtom> createState() => _VideoPlayerAtomState();
}

class _VideoPlayerAtomState extends State<VideoPlayerAtom> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.asset)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) return const SizedBox();
    return _videoContainer();
  }

  Widget _videoContainer() {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: widget.width,
          height: widget.height,
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),
        ),
        _playButton(),
      ],
    );
  }

  Widget _playButton() {
    if (_controller.value.isPlaying) return _pause();
    return _play();
  }

  Widget _play() {
    return IconButton(
      onPressed: () => setState(() {
        _controller.play();
      }),
      icon: const Icon(Icons.play_arrow),
    );
  }

  Widget _pause() {
    return OnHoverHiddenAtom(
      child: IconButton(
        onPressed: () => setState(() {
          _controller.pause();
        }),
        icon: const Icon(Icons.pause),
      ),
    );
  }
}

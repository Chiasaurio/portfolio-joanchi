part of '../_lib.dart';

class AppInformationWidget extends StatefulWidget {
  final AppModel app;
  const AppInformationWidget({super.key, required this.app});

  @override
  State<AppInformationWidget> createState() => _AppInformationWidgetState();
}

class _AppInformationWidgetState extends State<AppInformationWidget> {
  VideoPlayerController? _controller;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _initialize() async {
    if (_controller != null) {
      _controller!.pause();
      _controller!.dispose();
    }
    _controller = VideoPlayerController.asset(widget.app.videoAsset)
      ..initialize();
  }

  @override
  Widget build(BuildContext context) {
    /*  return FutureBuilder(
      future: _initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const SizedBox();
        } */
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          width: 550,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: _info(),
        ),
        const SizedBox(height: 20),
        _videPlayer(),
      ],
    );
    /*  },
    ); */
  }

  _onPlay() {
    _controller?.play();
  }

  _onPause() {
    _controller?.pause();
  }

  Widget _videPlayer() {
    return FutureBuilder(
      future: _initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const SizedBox();
        }
        return Center(
          child: VideoPlayerAtom(
            width: 500,
            asset: widget.app.videoAsset,
            controller: _controller!,
            onPlay: _onPlay,
            onPause: _onPause,
          ),
        );
      },
    );
  }

  Widget _info() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.app.nombre,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          widget.app.descripcion,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

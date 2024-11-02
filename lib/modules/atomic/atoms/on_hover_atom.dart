part of '_lib.dart';

class OnHoverAtom extends StatelessWidget {
  final Widget child;
  OnHoverAtom({super.key, required this.child});

  final ValueNotifier<bool> _isHover = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: _isHover,
        builder: (context, value, _) {
          final hoveredTransform = Matrix4.identity()..translate(1, -1, 0);
          final transform =
              _isHover.value ? hoveredTransform : Matrix4.identity();
          return MouseRegion(
            onEnter: (event) => _changeState(true),
            onExit: (event) => _changeState(false),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              transform: transform,
              child: child,
            ),
          );
        });
  }

  void _changeState(bool state) {
    _isHover.value = state;
  }
}

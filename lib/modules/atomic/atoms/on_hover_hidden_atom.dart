part of '_lib.dart';

class OnHoverHiddenAtom extends StatelessWidget {
  final Widget child;
  OnHoverHiddenAtom({super.key, required this.child});

  final ValueNotifier<bool> _isHover = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: _isHover,
        builder: (context, value, _) {
          return MouseRegion(
            onEnter: (event) => _changeState(true),
            onExit: (event) => _changeState(false),
            child: Visibility.maintain(
              visible: value,
              child: child,
            ),
          );
        });
  }

  void _changeState(bool state) {
    _isHover.value = state;
  }
}

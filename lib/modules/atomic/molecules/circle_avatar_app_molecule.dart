part of '_lib.dart';

class CircleAvatarAppMolecule extends StatelessWidget {
  final int id;
  final String asset;
  final Function() onTap;
  const CircleAvatarAppMolecule({
    super.key,
    required this.asset,
    required this.id,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OnHoverAtom(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Material(
          child: InkWell(
            onTap: onTap,
            child: _child(),
          ),
        ),
      ),
    );
  }

  Widget _child() {
    return Container(
      padding: const EdgeInsets.all(15.0),
      width: 100,
      height: 100,
      color: getColor.background,
      child: Image.asset(
        asset,
        height: 50,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}

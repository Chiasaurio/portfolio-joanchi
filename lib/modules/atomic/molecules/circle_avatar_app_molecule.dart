part of '_lib.dart';

class CircleAvatarAppMolecule extends StatelessWidget {
  final String asset;
  final bool isSelected;
  final Function() onTap;
  const CircleAvatarAppMolecule({
    super.key,
    required this.asset,
    required this.onTap,
    required this.isSelected,
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
      color: isSelected ? Colors.red : getColor.background,
      child: Image.asset(
        asset,
        height: 50,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}

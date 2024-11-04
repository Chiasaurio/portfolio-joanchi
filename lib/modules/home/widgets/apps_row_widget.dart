part of '../_lib.dart';

class AppsRowWidget extends StatelessWidget {
  const AppsRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 5.0,
      children: _buildList(),
    );
  }

  _buildList() {
    List<Widget> children = [];
    final apps = getApps();
    for (var i = 0; i < apps.length; i++) {
      final app = apps[i];
      Widget widget = FadeInLeft(
        animate: true,
        delay: Duration(milliseconds: 500 - 200 * i),
        child: CircleAvatarAppMolecule(
          asset: app.asset,
          isSelected: _isSelected(app.nombre),
          onTap: () => AppSelectedController.selectApp(app),
        ),
      );
      children.add(widget);
    }
    return children;
  }

  _isSelected(String name) {
    if (AppSelectedController.notifier!.appSelected == null) return false;

    if (AppSelectedController.notifier!.appSelected!.nombre == name) {
      return true;
    }

    return false;
  }
}

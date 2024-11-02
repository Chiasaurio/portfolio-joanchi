part of '../_lib.dart';

class AppsRowWidget extends StatelessWidget {
  const AppsRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 5.0,
      children: [
        ...getApps().map(
          (app) => CircleAvatarAppMolecule(
            id: 2,
            asset: app.asset,
            onTap: () => AppSelectedController.selectApp(app),
          ),
        )
      ],
    );
  }
}

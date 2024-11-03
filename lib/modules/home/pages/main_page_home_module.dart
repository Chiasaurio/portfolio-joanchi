part of '../_lib.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late double _paddingSides;

  @override
  void initState() {
    AppSelectedController.init();

    super.initState();
  }

  @override
  void dispose() {
    AppSelectedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _paddingSides = MediaQuery.of(context).size.width * 0.15;

    return DecoratedBox(
      decoration: _backgroundDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _paddingSides,
            vertical: 10,
          ),
          child: _view(),
        ),
      ),
    );
  }

  CustomScrollView _view() {
    return CustomScrollView(
      slivers: [
        SliverList.list(
          children: [
            _myInfo(),
            _appSelectedStream(),
          ],
        ),
      ],
    );
  }

  _myInfo() {
    return Row(
      children: [
        Container(
          height: 150,
          width: 150,
          color: getColor.primary,
          child: Icon(Icons.person),
        )
      ],
    );
  }

  BoxDecoration _backgroundDecoration() {
    return BoxDecoration(
      /*  image: DecorationImage(
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
        image: Image.asset(
          'assets/images/fotoparamo.jpg',
        ).image,
        fit: BoxFit.fitWidth,
      ), */
      gradient: LinearGradient(
        colors: [
          getColor.primary,
          getColor.secondary,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  Widget _appSelectedStream() {
    return ListenableBuilder(
      listenable: AppSelectedController.notifier!,
      builder: (_, child) {
        return Column(
          children: [
            const AppsRowWidget(),
            const SizedBox(height: 20),
            _appInfo(AppSelectedController.notifier!.appSelected),
          ],
        );
      },
    );
  }

  Widget _appInfo(AppModel? data) {
    return AnimatedOpacity(
        opacity: data == null ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 500),
        child: data == null
            ? null
            : AppInformationWidget(
                app: data,
              ));
  }
}

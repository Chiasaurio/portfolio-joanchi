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

  Widget _view() {
    return ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: CustomScrollView(
          slivers: [
            SliverList.list(
              children: [
                const MyInfoWidget(),
                _appSelectedStream(),
              ],
            ),
          ],
        ));
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
        return FadeInLeft(
          delay: const Duration(milliseconds: 200),
          from: 300,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: Column(
              children: [
                const AppsRowWidget(),
                const SizedBox(height: 20),
                _appInfo(AppSelectedController.notifier!.appSelected),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _appInfo(AppModel? data) {
    return AnimatedOpacity(
        opacity: data == null ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 500),
        child: data == null
            ? const SizedBox(height: 200)
            : AppInformationWidget(
                app: data,
              ));
  }
}

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

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _paddingSides,
          vertical: 10,
        ),
        child: _view(),
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
                const SizedBox(height: 50),
                const MyInfoWidget(),
                const SizedBox(height: 50),
                _appSelectedStream(),
              ],
            ),
          ],
        ));
  }

  Widget _appSelectedStream() {
    return ListenableBuilder(
      listenable: AppSelectedController.notifier!,
      builder: (_, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: [
              const AppsRowWidget(),
              const SizedBox(height: 20),
              _appInfo(AppSelectedController.notifier!.appSelected),
            ],
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

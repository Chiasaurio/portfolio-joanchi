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
    AppSelectedStream.init();
    super.initState();
  }

  @override
  void dispose() {
    AppSelectedStream.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _paddingSides = MediaQuery.of(context).size.width * 0.15;

    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2), BlendMode.dstATop),
          image: Image.asset(
            'assets/images/fotoparamo.jpg',
          ).image,
          fit: BoxFit.fitWidth,
        ),
        gradient: LinearGradient(
          colors: [
            getColor.primary,
            getColor.secondary,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: _paddingSides, vertical: 10),
          child: CustomScrollView(
            slivers: [
              SliverList.list(
                children: [
                  _appSelectedStream(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  StreamBuilder<AppModel> _appSelectedStream() {
    return StreamBuilder<AppModel>(
        stream: AppSelectedStream.appSelectedStream,
        builder: (context, snapshot) {
          return Column(
            children: [
              _appsRow(),
              const SizedBox(height: 20),
              _appContent(snapshot.data),
            ],
          );
        });
  }

  _selectApp(AppModel app) async {
    AppSelectedStream.update(app);
  }

  Widget _appsRow() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 5.0,
      children: [
        ...getApps().map(
          (app) => CircleAvatarAppMolecule(
            id: 2,
            asset: app.asset,
            onTap: () => _selectApp(app),
          ),
        )
      ],
    );
  }

  _appContent(AppModel? app) {
    return AnimatedOpacity(
      opacity: app == null ? 0.0 : 1.0,
      duration: const Duration(milliseconds: 500),
      child: app == null
          ? const SizedBox()
          : Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: getColor.background,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        app.nombre,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        app.descripcion,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: VideoPlayerAtom(
                    width: 500,
                    asset: app.videoAsset,
                  ),
                ),
              ],
            ),
    );
  }
}

part of '../_lib.dart';

class AppModel {
  String nombre;
  String descripcion;
  String moreInfo;
  String asset;
  String videoAsset;
  AppModel({
    required this.nombre,
    required this.descripcion,
    required this.moreInfo,
    required this.asset,
    required this.videoAsset,
  });
}

List<AppModel> getApps() {
  AppModel app1 = AppModel(
    nombre: 'Aplicación de bodegas',
    descripcion:
        'Aplicación para la gestión de bodegas, creación de usuarios, coordinadores y operarios, creación de sedes, registro de productos con nombre, ubicación, peso, dimensiones e imagen.',
    moreInfo: 'Tecnologias involucradas: Flutter, Laravel',
    asset: 'assets/logos/innvestock-logo.png',
    videoAsset: 'assets/videos/innvestock-preview.mp4',
  );

  AppModel app2 = AppModel(
    nombre: 'E-commerce',
    descripcion:
        'Aplicación para venta de productos, reseñas, edición de perfil.',
    moreInfo: 'Tecnologias involucradas: Flutter, Laravel',
    asset: 'assets/logos/default-logo.png',
    videoAsset: 'assets/videos/e-commerce.mp4',
  );

  AppModel app3 = AppModel(
    nombre: 'Tuten Pro',
    descripcion:
        'Aplicación para manejo de turnos, calendario, asignación de servicios.',
    moreInfo: 'Tecnologias involucradas: Flutter, Streams, ChangeNotifier',
    asset: 'assets/logos/default-logo.png',
    videoAsset: 'assets/videos/innvestock-preview.mp4',
  );
  return [app1, app2, app3];
}

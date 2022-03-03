import 'package:dio/native_imp.dart';
import 'shared/repositories/poke_api_repository.dart';
import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dex/app/modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => PokeApiRepository(DioForNative())),
        Bind((i) => AppController()),
      ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}

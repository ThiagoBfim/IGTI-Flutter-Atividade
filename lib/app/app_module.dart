import 'package:atividade/app/modules/home/home_module.dart';
import 'package:atividade/app/modules/imc/imc_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        $AppController,
      ];


  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
    ModuleRoute('/imc', module: ImcModule()),
  ];

}

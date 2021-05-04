import 'package:atividade/app/modules/imc/imc_Page.dart';
import 'package:atividade/app/modules/imc/imc_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ImcModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ImcStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: (_, args) => ImcPage(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 600)),
  ];
}

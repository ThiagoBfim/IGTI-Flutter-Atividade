import 'package:atividade/app/modules/chat/chat_module.dart';
import 'package:atividade/app/modules/home/home_module.dart';
import 'package:atividade/app/modules/imc/imc_module.dart';
import 'package:atividade/app/modules/todo/todo_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
      ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
    ModuleRoute('/imc', module: ImcModule()),
    ModuleRoute('/todo', module: TodoModule()),
    ModuleRoute('/chat', module: ChatModule()),
  ];
}

import 'package:atividade/app/modules/money/money_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../money/money_store.dart';

import 'money_page.dart';

class MoneyModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MoneyApi(i.get<Dio>())),
    Bind.lazySingleton((i) => MoneyStore(i.get<MoneyApi>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}

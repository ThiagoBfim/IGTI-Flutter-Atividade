import 'package:atividade/app/modules/todo/storage_todo.dart';
import 'package:atividade/app/modules/todo/todo_Page.dart';
import 'package:atividade/app/modules/todo/todo_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TodoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => TodoStore()),
    $StorageTodo
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => TodoPage()),
  ];
}

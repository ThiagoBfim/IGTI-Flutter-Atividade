import 'dart:convert';

import 'package:atividade/app/modules/todo/domain/todo.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'storage_todo.g.dart';

@Injectable()
class StorageTodo {
  static const String TODO_KEY = "_TODO_KEY";

  Future<List<Todo>> loadTodos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var todos = prefs.getString(TODO_KEY);
    if (todos != null) {
      return List<Todo>.from(
          jsonDecode(todos).map<Todo>((model) => Todo.fromMap(model)));
    }
    return [];
  }

  saveTodos(List<Todo> todos) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var json = jsonEncode(todos.map((e) => e.toMap()).toList());

    prefs.setString(TODO_KEY, json);
  }
}

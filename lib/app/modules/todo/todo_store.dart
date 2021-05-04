import 'package:atividade/app/modules/todo/domain/todo.dart';
import 'package:atividade/app/modules/todo/storage_todo.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'todo_store.g.dart';

class TodoStore = _TodoStoreBase with _$TodoStore;
abstract class _TodoStoreBase with Store {

  final StorageTodo storageTodo = Modular.get<StorageTodo>();

  @observable
  List<Todo> todos = ObservableList();

  String nomeAtividade = '';

  @action
  void loadElements() async {
    this.todos.addAll(await storageTodo.loadTodos());
  }

  @action
  void addElement(String nomeAtividade) {
    this.todos.add(Todo(nomeAtividade));
    storageTodo.saveTodos(todos);
  }

  @action
  void changeDone(Todo todo) {
    todo.done = !todo.done;
    var indexOf = this.todos.indexOf(todo);
    this.todos.insert(indexOf, todo);
    this.todos.removeAt(indexOf +1);
    storageTodo.saveTodos(todos);
  }
}
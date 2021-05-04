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
  Future<void> loadElements() async {
    this.todos.addAll(await storageTodo.loadTodos());
  }

  @action
  void addElement(String nomeAtividade) {
    var todo = Todo(nomeAtividade);
    if (!this.todos.contains(todo)) {
      this.todos.add(Todo(nomeAtividade));
      storageTodo.saveTodos(todos);
    }
  }

  @action
  void editElement(Todo todo, String nomeAtividade) {
    var indexOf = this.todos.indexOf(todo);
    todo.name = nomeAtividade;
    this.todos.insert(indexOf, todo);
    this.todos.removeAt(indexOf + 1);
    storageTodo.saveTodos(todos);
  }

  @action
  void removeElement(Todo todo) {
    var indexOf = this.todos.indexOf(todo);
    this.todos.removeAt(indexOf);
    storageTodo.saveTodos(todos);
  }

  @action
  void changeDone(Todo todo) {
    todo.done = !todo.done;
    var indexOf = this.todos.indexOf(todo);
    this.todos.insert(indexOf, todo);
    this.todos.removeAt(indexOf + 1);
    storageTodo.saveTodos(todos);
  }
}

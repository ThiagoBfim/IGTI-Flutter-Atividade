import 'package:atividade/app/modules/todo/domain/todo.dart';
import 'package:mobx/mobx.dart';

part 'todo_store.g.dart';

class TodoStore = _TodoStoreBase with _$TodoStore;
abstract class _TodoStoreBase with Store {

  @observable
  List<Todo> todos = ObservableList();

  String nomeAtividade = '';

  @action
  void addElement(String nomeAtividade) {
    this.todos.add(Todo(nomeAtividade));
  }

  @action
  void changeDone(Todo todo) {
    todo.done = !todo.done;
    var indexOf = this.todos.indexOf(todo);
    this.todos.insert(indexOf, todo);
    this.todos.removeAt(indexOf +1);
  }
}
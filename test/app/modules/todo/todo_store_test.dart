import 'package:flutter_test/flutter_test.dart';
import 'package:atividade/app/modules/todo/todo_store.dart';
 
void main() {
  late TodoStore store;

  setUpAll(() {
    store = TodoStore();
  });

}
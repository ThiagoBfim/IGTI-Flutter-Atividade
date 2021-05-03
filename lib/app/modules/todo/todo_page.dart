import 'package:atividade/app/modules/todo/todo_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/todo.dart';

class TodoPage extends StatefulWidget {
  final String title;

  const TodoPage({Key? key, this.title = 'Todo`s'}) : super(key: key);

  @override
  TodoPageState createState() => TodoPageState();
}

class TodoPageState extends State<TodoPage> {
  final TodoStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    store.addElement("Flutter modulo 5");
    store.addElement("Flutter modulo 6");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: createList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _newTodo,
        child: Icon(Icons.save),
      ),
    );
  }

  Widget createList() {
    return Observer(
        builder: (_) => ListView.builder(
              itemCount: store.todos.length,
              itemBuilder: (ctx, index) =>
                  _createItem(store.todos[index]),
            ));
  }

  Widget _createItem(Todo todo) {
    return CheckboxListTile(
      title: Text(
        todo.name,
        style: new TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0),
      ),
      value: todo.done,
      onChanged: (bool? value) {
        store.changeDone(todo);
      },
    );
  }

  void _newTodo() {
    var controller = TextEditingController();
    Widget okButton = ElevatedButton(
      child: Text("SALVAR"),
      onPressed: () {
        store.addElement(controller.text);
        Navigator.pop(context);
      },
    );
    AlertDialog alerta = AlertDialog(
      title: Text("Nova Atividade"),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: 'Nome da Atividade',
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
        ),
      ),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(child: alerta);
      },
    );
  }
}

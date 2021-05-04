class Todo {
  String name;

  bool done = false;

  Todo(this.name, {this.done = false});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todo && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;

  Todo.fromMap(Map<String, dynamic> map)
      : done = map["done"],
        name = map["_name"];

  Map<String, dynamic> toMap() {
    return {
      '_name': this.name,
      'done': this.done,
    };
  }
}

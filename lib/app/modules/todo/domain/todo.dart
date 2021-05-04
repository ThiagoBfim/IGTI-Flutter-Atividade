class Todo {
  final String _name;

  bool done = false;

  Todo(this._name, {this.done = false});

  String get name => _name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todo && runtimeType == other.runtimeType && _name == other._name;

  @override
  int get hashCode => _name.hashCode;

  Todo.fromMap(Map<String, dynamic> map)
      : done = map["done"],
        _name = map["_name"];

  Map<String, dynamic> toMap() {
    return {
      '_name': this._name,
      'done': this.done,
    };
  }
}

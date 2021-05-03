class Todo {
  late String _name;

  late bool done = false;

  Todo(this._name);

  String get name => _name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Todo && runtimeType == other.runtimeType && _name == other._name;

  @override
  int get hashCode => _name.hashCode;

}

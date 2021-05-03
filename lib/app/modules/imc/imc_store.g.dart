// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imc_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ImcStore on _ImcStoreBase, Store {
  final _$alturaAtom = Atom(name: '_ImcStoreBase.altura');

  @override
  String get altura {
    _$alturaAtom.reportRead();
    return super.altura;
  }

  @override
  set altura(String value) {
    _$alturaAtom.reportWrite(value, super.altura, () {
      super.altura = value;
    });
  }

  final _$pesoAtom = Atom(name: '_ImcStoreBase.peso');

  @override
  String get peso {
    _$pesoAtom.reportRead();
    return super.peso;
  }

  @override
  set peso(String value) {
    _$pesoAtom.reportWrite(value, super.peso, () {
      super.peso = value;
    });
  }

  final _$resultadoAtom = Atom(name: '_ImcStoreBase.resultado');

  @override
  String get resultado {
    _$resultadoAtom.reportRead();
    return super.resultado;
  }

  @override
  set resultado(String value) {
    _$resultadoAtom.reportWrite(value, super.resultado, () {
      super.resultado = value;
    });
  }

  final _$_ImcStoreBaseActionController =
      ActionController(name: '_ImcStoreBase');

  @override
  void changeAltura(dynamic altura) {
    final _$actionInfo = _$_ImcStoreBaseActionController.startAction(
        name: '_ImcStoreBase.changeAltura');
    try {
      return super.changeAltura(altura);
    } finally {
      _$_ImcStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePeso(dynamic peso) {
    final _$actionInfo = _$_ImcStoreBaseActionController.startAction(
        name: '_ImcStoreBase.changePeso');
    try {
      return super.changePeso(peso);
    } finally {
      _$_ImcStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic calcular() {
    final _$actionInfo = _$_ImcStoreBaseActionController.startAction(
        name: '_ImcStoreBase.calcular');
    try {
      return super.calcular();
    } finally {
      _$_ImcStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
altura: ${altura},
peso: ${peso},
resultado: ${resultado}
    ''';
  }
}

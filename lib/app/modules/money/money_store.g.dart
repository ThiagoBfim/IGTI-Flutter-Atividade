// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MoneyStore on MoneyStoreBase, Store {
  final _$qtdReaisAtom = Atom(name: 'MoneyStoreBase.qtdReais');

  @override
  String get qtdReais {
    _$qtdReaisAtom.reportRead();
    return super.qtdReais;
  }

  @override
  set qtdReais(String value) {
    _$qtdReaisAtom.reportWrite(value, super.qtdReais, () {
      super.qtdReais = value;
    });
  }

  final _$priceEuroAtom = Atom(name: 'MoneyStoreBase.priceEuro');

  @override
  String get priceEuro {
    _$priceEuroAtom.reportRead();
    return super.priceEuro;
  }

  @override
  set priceEuro(String value) {
    _$priceEuroAtom.reportWrite(value, super.priceEuro, () {
      super.priceEuro = value;
    });
  }

  final _$resultAtom = Atom(name: 'MoneyStoreBase.result');

  @override
  String get result {
    _$resultAtom.reportRead();
    return super.result;
  }

  @override
  set result(String value) {
    _$resultAtom.reportWrite(value, super.result, () {
      super.result = value;
    });
  }

  final _$setPriceEuroAsyncAction = AsyncAction('MoneyStoreBase.setPriceEuro');

  @override
  Future<void> setPriceEuro(String priceEuro) {
    return _$setPriceEuroAsyncAction.run(() => super.setPriceEuro(priceEuro));
  }

  final _$calcularAsyncAction = AsyncAction('MoneyStoreBase.calcular');

  @override
  Future<void> calcular() {
    return _$calcularAsyncAction.run(() => super.calcular());
  }

  final _$limparAsyncAction = AsyncAction('MoneyStoreBase.limpar');

  @override
  Future<void> limpar() {
    return _$limparAsyncAction.run(() => super.limpar());
  }

  @override
  String toString() {
    return '''
qtdReais: ${qtdReais},
priceEuro: ${priceEuro},
result: ${result}
    ''';
  }
}

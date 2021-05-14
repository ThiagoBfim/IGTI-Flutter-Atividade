import 'package:atividade/app/modules/money/money_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'money_store.g.dart';

class MoneyStore = MoneyStoreBase with _$MoneyStore;

abstract class MoneyStoreBase with Store {
  final MoneyApi moneyApi;

  TextEditingController qtdReaisController = new TextEditingController();
  TextEditingController priceEuroController = new TextEditingController();

  @observable
  String qtdReais = '';

  @observable
  String priceEuro = '';

  @observable
  String result = '';

  MoneyStoreBase(this.moneyApi);

  initState() async {
    var money = await moneyApi.getPriceEur();
    priceEuroController.text = money.value.toStringAsFixed(2);
    setPriceEuro(money.value.toStringAsFixed(2));
  }

  Future<void> setQtdReais(String qtdReais) async {
    this.qtdReais = qtdReais;
  }

  @action
  Future<void> setPriceEuro(String priceEuro) async {
    this.priceEuro = priceEuro;
  }

  @action
  Future<void> calcular() async {
    var qtdCedulas = double.parse(qtdReais) / double.parse(priceEuro);
    result =
        'Com $qtdReais reais é possível comprar ${qtdCedulas.toStringAsFixed(2)} a $priceEuro cada';
  }

  @action
  Future<void> limpar() async {
    setPriceEuro('');
    setQtdReais('');
    priceEuroController.clear();
    qtdReaisController.clear();
    result = '';
  }
}

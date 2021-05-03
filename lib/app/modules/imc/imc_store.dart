import 'package:mobx/mobx.dart';

part 'imc_store.g.dart';

class ImcStore = _ImcStoreBase with _$ImcStore;

abstract class _ImcStoreBase with Store {
  @observable
  String altura = "";

  @observable
  String peso = "";

  @observable
  String resultado = "";

  @action
  void changeAltura(altura) {
    this.altura = altura;
  }

  @action
  void changePeso(peso) {
    this.peso = peso;
  }

  @action
  calcular() {
    double imc =
        double.parse(peso) / (double.parse(altura) * double.parse(altura));
    String imcResultado = "\nIMC: ${imc.toStringAsFixed(2)}";
    if (imc < 18.5) {
      resultado = "MAGREZA!$imcResultado";
    } else if (imc < 24.9) {
      resultado = "NORMAL!$imcResultado";
    } else if (imc < 29.9) {
      resultado = "SOBREPESO!$imcResultado";
    } else if (imc < 39.9) {
      resultado = "OBESIDADE!$imcResultado";
    } else {
      resultado = "OBESIDADE GRAVE!$imcResultado";
    }
  }
}

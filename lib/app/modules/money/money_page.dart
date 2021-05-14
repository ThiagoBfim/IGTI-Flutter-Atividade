import 'package:atividade/app/modules/money/money_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, MoneyStore> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controller.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversor de Moedas'),
      ),
      body: Observer(
        builder: (_) =>
           Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Center(
                  child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("assets/images/money.png"),
                    TextFormField(
                      controller: controller.qtdReaisController,
                      validator: (value) =>
                          value!.isEmpty ? 'Campo obrigatório' : null,
                      maxLength: 10,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter(RegExp(r'^\d+\.?\d{0,2}'),
                            allow: true),
                      ],
                      keyboardType: TextInputType.number,
                      onChanged: controller.setQtdReais,
                      decoration:
                          InputDecoration(labelText: 'Quantidade em reais'),
                    ),
                    TextFormField(
                      controller: controller.priceEuroController,
                      validator: (value) =>
                          value!.isEmpty ? 'Campo obrigatório' : null,
                      maxLength: 10,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter(RegExp(r'^\d+\.?\d{0,2}'),
                            allow: true),
                      ],
                      keyboardType: TextInputType.number,
                      onChanged: controller.setPriceEuro,
                      decoration: InputDecoration(labelText: 'Preço do euro'),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            width: 200,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: _calcular,
                              child: Text("Calcular"),
                            ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: 200,
                            height: 40,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(Colors.grey),
                              ),
                              onPressed: _limpar,
                              child: Text("Limpar"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      controller.result,
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              )),
            ),
          )
      ),
    );
  }

  void _calcular() {
    if (_formKey.currentState!.validate()) {
      controller.calcular();
    }
  }

  void _limpar() async {
    await controller.limpar();
    // _formKey.currentState!.reset();
  }
}

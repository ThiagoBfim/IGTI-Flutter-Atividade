import 'package:atividade/app/modules/imc/imc_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ImcPage extends StatefulWidget {
  final String title;

  const ImcPage({Key? key, this.title = 'IMC'}) : super(key: key);

  @override
  ImcPageState createState() => ImcPageState();
}

class ImcPageState extends State<ImcPage> {
  final ImcStore store = Modular.get();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/imc.png"),
              Center(
                child: Observer(
                  builder: (_) =>
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextFormField(
                              initialValue: store.peso,
                              validator: (value) =>
                              value!.isEmpty ? 'Campo obrigatório' : null,
                              maxLength: 10,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter(RegExp(r'^\d+\.?\d{0,2}'), allow: true),
                              ],
                              keyboardType: TextInputType.number,
                              onChanged: store.changePeso,
                              decoration: InputDecoration(labelText: 'Peso'),
                            ),
                            TextFormField(
                              initialValue: store.altura,
                              validator: (value) =>
                              value!.isEmpty ? 'Campo obrigatório' : null,
                              maxLength: 10,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter(RegExp(r'^\d+\.?\d{0,2}'), allow: true),
                              ],
                              keyboardType: TextInputType.number,
                              onChanged: store.changeAltura,
                              decoration: InputDecoration(labelText: 'Altura'),
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              width: 200,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: _calcular,
                                child: Text("Calcular"),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              store.resultado,
                              style: TextStyle(fontSize: 35),
                            ),
                          ],
                        ),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _calcular() {
    if (_formKey.currentState!.validate()) {
      store.calcular();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Formulário com erro!")));
    }
  }
}

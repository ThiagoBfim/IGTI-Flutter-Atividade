import 'package:atividade/app/modules/chat/chat_module.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
 
void main() {

  setUpAll(() {
    initModule(ChatModule());
  });
}
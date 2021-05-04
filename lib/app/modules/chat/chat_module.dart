import 'package:atividade/app/modules/chat/chat_Page.dart';
import 'package:atividade/app/modules/chat/chat_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChatModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ChatService()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ChatPage()),
  ];
}

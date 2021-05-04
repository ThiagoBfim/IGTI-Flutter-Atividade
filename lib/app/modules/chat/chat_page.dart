import 'package:atividade/app/modules/chat/chat_service.dart';
import 'package:atividade/app/modules/chat/domain/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChatPage extends StatefulWidget {
  final String title;

  const ChatPage({Key? key, this.title = 'Chat'}) : super(key: key);

  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {
  final ChatService store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Post>>(
        future: store.loadList(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            return _buildListItem(snapshot.data!);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildListItem(List<Post> data) {
    return ListView.separated(
        itemBuilder: (ctx, index) => _buildPost(data[index]),
        separatorBuilder: (ctx, index) => Divider(),
        itemCount: data.length);
  }

  _buildPost(Post data) {
    return ListTile(
      title: Text(data.title),
      subtitle: Text(data.body),
    );
  }
}

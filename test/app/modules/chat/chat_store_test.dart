import 'package:atividade/app/modules/chat/chat_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ChatService service;

  setUpAll(() {
    service = ChatService();
  });

  test('test Load Post List', () async {
    var loadList = await service.loadList();
    expect(loadList.length, 100);
  });

  test('test Create Post', () async {
     var post = await service.newPost(title: "title1", body: "body2");
     expect(post.title, "title1");
     expect(post.body, "body2");

  });
}

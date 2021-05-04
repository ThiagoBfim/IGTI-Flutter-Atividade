
import 'package:atividade/app/modules/chat/domain/post.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

part 'chat_service.g.dart';

class ChatService {
  Dio dio = new Dio();

  Future<List<Post>> loadList() async {
    var response = await dio.get("https://jsonplaceholder.typicode.com/posts");
    return List<Post>.from(
        response.data.map<Post>((model) => Post.fromMap(model)));
  }

  Future<Post> newPost({required String title, required String body}) async {
    var response = await dio.post("https://jsonplaceholder.typicode.com/posts",
        data: {
          'title': title,
          'body': body,
          'userId': 1,
        },
        options: Options(
            headers: {'Content-type': 'application/json; charset=UTF-8'}));
    return Post.fromMap(response.data);
  }
}

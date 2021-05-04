class Post {
  final int id;
  final String title;
  final String body;

  Post(this.id, this.title, this.body);

  Post.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        body = map['body'];

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'body': this.body,
    };
  }
}

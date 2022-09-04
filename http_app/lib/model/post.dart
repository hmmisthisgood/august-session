// {
//     "userId": 1,
//     "id": 1,
//     "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
//     "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
//   },

class Post {
  final int userId, id;
  final String title, body;

  Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

//// Json serialization
  static Post toPost(Map json) {
    print(json);

    final uId = json['userId'];

    return Post(
        userId: uId, id: json['id'], title: json['title'], body: json['body']);
  }
}

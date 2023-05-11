class PostModel {
  late final int id;
  late final String title;
  late final String body;

  PostModel.fromJson(Map<String, dynamic> parsedPost)
      : id = parsedPost['id'],
        title = parsedPost['title'],
        body = parsedPost['body'];
}

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_meetuper/src/models/post_model.dart';

class PostApiProvider {
  final String _url = "https://jsonplaceholder.typicode.com/posts";

  Future<List<PostModel>> fetchPosts() async {
    final response = await http.get(Uri.parse(_url));

    // One Way
    final posts = <PostModel>[];
    final parsedPosts = json.decode(response.body);
    for (var post in parsedPosts) {
      posts.add(PostModel.fromJson(post));
    }

    // Other Way
    // final List<dynamic> parsedPosts = json.decode(res.body);
    // final List<PostModel> posts = parsedPosts.map((post) {
    //   return PostModel.fromJson(post);
    // }).toList();

    return posts;
  }
}

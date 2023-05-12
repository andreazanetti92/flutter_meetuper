import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:faker/faker.dart';

import 'package:flutter_meetuper/src/models/post_model.dart';

class PostApiProvider {
  static final PostApiProvider _singleton = PostApiProvider._internal();

  factory PostApiProvider() => _singleton;

  PostApiProvider._internal();

  final String _url = "https://jsonplaceholder.typicode.com/posts";

  FutureOr<List<PostModel>> fetchPosts() async {
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

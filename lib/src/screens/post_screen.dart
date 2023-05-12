import 'package:flutter/material.dart';
import 'package:flutter_meetuper/src/models/post_model.dart';
import 'package:flutter_meetuper/src/resources/post_api_provider.dart';
import 'package:flutter_meetuper/src/widgets/bottom_navigation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostScreen extends StatefulWidget {
  final PostApiProvider _api = PostApiProvider();
  @override
  State<StatefulWidget> createState() {
    return _PostScreenState();
  }
}

class _PostScreenState extends State<PostScreen> {
  final String pageTitle = "Posts Screen";
  List<PostModel> _posts = [];

  @override
  void initState() {
    super.initState();
    _getPosts();
  }

  _getPosts() async {
    List<PostModel> posts =
        await widget._api.fetchPosts(); // widget is the stateful widget
    setState(() => _posts = posts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _PostList(
        posts: _posts,
      ),
      // OLD CODE BELOW
      // ListView(
      //     children: _posts.map((post) {
      //   return ListTile(
      //     title: Text(post['title']),
      //     subtitle: Text(post['body']),
      //   );
      // }).toList()),
      bottomNavigationBar: BottomNavigation(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: "Get a Post",
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(pageTitle),
      ),
    );
  }
}

class _PostList extends StatelessWidget {
  List<PostModel> posts = [];

  _PostList({required this.posts});

  @override
  Widget build(BuildContext context) {
    // return ListView(
    //   children: posts.map((post) => PostBody(post: post)).toList(),
    // );
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int i) {
        // i 0: 0 ~/ 2 = 0  ListTile
        // i 1: isOdd       Divider
        // i 2: 2 ~/ 2 = 1  ListTile
        // i 3: isOdd       Divider
        // i 4: 4 ~/ 2 = 2  ListTile
        // i 5: isOdd       Divider
        // i 6: 6 ~/ 2 = 3  ListTile
        // ...

        if (i.isOdd) {
          return const Divider();
        }

        // Because you returning above
        // you will skip all the od number
        // So you divid the i by 2
        final index = i ~/ 2;

        return ListTile(
          title: Text(posts[index].title),
          subtitle: Text(posts[index].body),
        );
      },
    );
  }
}

// ignore: must_be_immutable
// class PostBody extends StatelessWidget {
//   late dynamic post;

//   PostBody({super.key, required this.post});

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(post['title']),
//       subtitle: Text(post['body']),
//     );
//   }
// }

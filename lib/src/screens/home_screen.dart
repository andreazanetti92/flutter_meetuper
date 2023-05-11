import 'package:flutter/material.dart';
import 'package:flutter_meetuper/src/screens/meetup_detail_screen.dart';
import 'package:flutter_meetuper/src/widgets/bottom_navigation.dart';

class HomeScreen extends StatelessWidget {
  late String appTitle;

  HomeScreen({required this.appTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Hello in $appTitle",
              textDirection: TextDirection.ltr,
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/meetup-detail"),
              child: const Text("Go to Detail"),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
      appBar: AppBar(
        title: Text(appTitle),
      ),
    );
  }
}

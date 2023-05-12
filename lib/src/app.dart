import 'package:flutter/material.dart';
// import 'package:flutter_meetuper/src/screens/home_screen.dart';
import 'package:flutter_meetuper/src/screens/meetup_detail_screen.dart';
import 'package:flutter_meetuper/src/screens/post_screen.dart';

class App extends StatelessWidget {
  // final String _appTitle = "Meetuper App";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      // home: HomeScreen(
      //   appTitle: _appTitle,
      // ),
      home: PostScreen(),
      routes: {
        MeetupDetailScreen.route: (context) => MeetupDetailScreen(),
      },
    );
  }
}

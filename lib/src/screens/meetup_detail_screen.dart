import 'package:flutter/material.dart';

class MeetupDetailScreen extends StatelessWidget {
  static const String route = "/meetup-detail";

  final String _screenTitle = "Meetup Details Screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screenTitle),
      ),
      body: Text("I'm $_screenTitle"),
    );
  }
}

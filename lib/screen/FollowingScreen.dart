import 'package:flutter/material.dart';
import 'package:social/widget/SimpleUserListView.dart';

class FollowingScreen extends StatelessWidget {
  int count;
  late SimpleUserListView _simpleUserListView;

  FollowingScreen({required this.count});

  FollowingScreen.empty() : count = 0;

  @override
  Widget build(BuildContext context) {
    _simpleUserListView = SimpleUserListView(
      count: count,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Following"),
      ),
      body: Column(
        children: [
          Expanded(
            child: _simpleUserListView,
          ),
        ],
      ),
    );
  }
}

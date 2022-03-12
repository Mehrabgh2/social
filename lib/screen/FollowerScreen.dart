import 'package:flutter/material.dart';
import 'package:social/widget/SimpleUserListView.dart';

class FollowerScreen extends StatelessWidget {
  int count;
  late SimpleUserListView _simpleUserListView;

  FollowerScreen({required this.count});

  FollowerScreen.empty() : count = 0;

  @override
  Widget build(BuildContext context) {
    _simpleUserListView = SimpleUserListView(
      count: count,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Follower"),
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social/main.dart';
import 'package:social/widget/FollowingListView.dart';
import 'package:social/widget/SimpleUserListView.dart';

class MyFollowingScreen extends StatelessWidget {
  late FollowingListView _followingListView;
  Function unfollow;

  MyFollowingScreen({required this.unfollow});

  @override
  Widget build(BuildContext context) {
    _followingListView = FollowingListView(unfollow: unfollow);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Following"),
      ),
      body: Column(
        children: [
          Expanded(
            child: _followingListView,
          ),
        ],
      ),
    );
  }
}

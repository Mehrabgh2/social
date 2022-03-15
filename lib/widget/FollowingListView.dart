import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social/db/FollowedDBProvider.dart';
import 'package:social/model/User.dart';
import 'package:social/widget/FollowingUserRowWidget.dart';

class FollowingListView extends StatelessWidget {
  final controller = Get.put(FollowingListViewController());
  Function unfollow;

  FollowingListView({required this.unfollow});

  @override
  Widget build(BuildContext context) {
    controller.updateUsers(FollowedDBProvider.instance.getFollowings());
    return Column(children: [
      Expanded(
        child: Scaffold(
          body: Obx(() {
            return ListView.builder(
              itemCount: controller.users.value.length,
              itemBuilder: (context, index) {
                return FollowingUserRowWidget(
                  user: controller.users.value.elementAt(index),
                  remove: remove,
                );
              },
            );
          }),
        ),
      ),
    ]);
  }

  void remove(User user) {
    controller.removeUser(user);
    unfollow(user);
  }
}

class FollowingListViewController extends GetxController {
  var users = <User>[].obs;

  updateUsers(List<User> followedUsers) {
    users(followedUsers);
    users.refresh();
  }

  removeUser(User user) {
    users.remove(user);
    users.refresh();
  }
}

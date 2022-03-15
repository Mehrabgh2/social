import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social/controller/FollowingController.dart';
import 'package:social/db/FollowedDBProvider.dart';
import 'package:social/model/User.dart';
import 'package:social/widget/FollowingUserRowWidget.dart';

class FollowingListView extends StatelessWidget {
  FollowingController followingController = Get.find<FollowingController>();
  Function setItemsFollow;

  FollowingListView({required this.setItemsFollow});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: Scaffold(
          body: Obx(() {
            return ListView.builder(
              itemCount: followingController.followings.value.length,
              itemBuilder: (context, index) {
                return FollowingUserRowWidget(
                  user: followingController.followings.value.elementAt(index),
                  setItemsFollow: setItemsFollow,
                );
              },
            );
          }),
        ),
      ),
    ]);
  }
}

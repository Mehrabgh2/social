import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social/controller/FollowingController.dart';
import 'package:social/db/FollowedDBProvider.dart';
import 'package:social/model/User.dart';
import 'package:social/screen/OtherProfileScreen.dart';

class FollowingUserRowWidget extends StatelessWidget {
  FollowingUserRowWidget({required this.user, required this.setItemsFollow});

  User user;
  Function setItemsFollow;
  FollowingController followingController = Get.find<FollowingController>();

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          Get.to(OtherProfileScreen(user: user));
        },
        tileColor: Colors.white,
        leading: CircleAvatar(
            radius: 20, backgroundImage: NetworkImage(user.picture.thumbnail)),
        title: Text("${user.name.first} ${user.name.last}"),
        subtitle: Text(user.email),
        trailing: ElevatedButton(
          onPressed: () {
            FollowedDBProvider.instance.removeFollowing(user.email);
            followingController.updateFollowing();
            setItemsFollow();
          },
          child: const Text("unfollow"),
        ));
  }
}

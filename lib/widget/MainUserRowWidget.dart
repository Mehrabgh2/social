import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social/controller/FollowingController.dart';
import 'package:social/db/FollowedDBProvider.dart';
import 'package:social/model/User.dart';
import 'package:social/screen/OtherProfileScreen.dart';

class MainUserRowWidget extends StatelessWidget {
  MainUserRowWidget({required this.user});
  FollowingController followingController = Get.find<FollowingController>();

  User user;

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
      trailing: Obx(() {
        return IconButton(
            color: Colors.blue,
            icon: Icon(user.followController.followed.value
                ? Icons.person_add_alt_1
                : Icons.person_add_alt),
            onPressed: () {
              if (user.followController.followed.value) {
                FollowedDBProvider.instance.removeFollowing(user.email);
                user.updateFollowed(false);
              } else {
                FollowedDBProvider.instance.addFollowing(user);
                user.updateFollowed(true);
              }
              followingController.updateFollowing();
            });
      }),
    );
  }
}

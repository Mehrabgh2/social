import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social/model/User.dart';
import 'package:social/screen/OtherProfileScreen.dart';

class SimpleUserRowWidget extends StatelessWidget {
  User user;

  SimpleUserRowWidget({required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(OtherProfileScreen(user: user));
      },
      title: Text("${user.name.first} ${user.name.last}"),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.picture.thumbnail),
        radius: 20,
      ),
    );
  }
}

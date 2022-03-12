import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social/model/User.dart';
import 'package:social/screen/OtherProfileScreen.dart';

class MainUserRowWidget extends StatelessWidget {
  MainUserRowWidget({required this.user});

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
              icon: Icon(user.followed.value
                  ? Icons.person_add_alt_1
                  : Icons.person_add_alt),
              onPressed: () => user.updateFollowed(!user.followed.value));
        }));
  }
}

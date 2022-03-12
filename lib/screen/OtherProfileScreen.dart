import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social/model/MockUser.dart';
import 'package:social/model/User.dart';
import 'package:social/screen/FollowerScreen.dart';
import 'package:social/screen/FollowingScreen.dart';

class OtherProfileScreen extends StatelessWidget {
  User user;

  OtherProfileScreen({required this.user});

  OtherProfileScreen.empty() : user = MockUser.getMockUser();

  @override
  Widget build(BuildContext context) {
    int followerCount = Random().nextInt(200);
    int followingCount = Random().nextInt(200);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(
            top: size.width / 25,
            left: size.width / 45,
            right: size.width / 45),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            CircleAvatar(
              radius: size.width / 10,
              backgroundImage: NetworkImage("${user.picture.medium}"),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${user.name.title} ${user.name.first} ${user.name.last}",
              style: TextStyle(
                  fontSize: size.width / 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Text(
                        "Posts",
                        style: TextStyle(
                            fontSize: size.width / 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "20",
                        style: TextStyle(
                            fontSize: size.width / 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(25),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(FollowerScreen(count: followerCount));
                      },
                      child: Column(
                        children: [
                          Text(
                            "Followers",
                            style: TextStyle(
                                fontSize: size.width / 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            followerCount.toString(),
                            style: TextStyle(
                                fontSize: size.width / 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )),
                Container(
                  padding: const EdgeInsets.all(25),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(FollowingScreen(count: followingCount));
                    },
                    child: Column(
                      children: [
                        Text(
                          "Following",
                          style: TextStyle(
                              fontSize: size.width / 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          followingCount.toString(),
                          style: TextStyle(
                              fontSize: size.width / 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

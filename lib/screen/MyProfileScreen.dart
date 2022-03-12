import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social/controller/UserProfileController.dart';
import 'package:social/screen/FollowerScreen.dart';
import 'package:social/screen/FollowingScreen.dart';

class MyProfileScreen extends StatelessWidget {
  UserProfileController profileController = Get.find<UserProfileController>();

  @override
  Widget build(BuildContext context) {
    profileController.getMyUser();
    int followerCount = Random().nextInt(200);
    int followingCount = Random().nextInt(200);
    final size = MediaQuery.of(context).size;
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
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
                backgroundImage:
                    NetworkImage(profileController.user.value.picture.medium),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${profileController.user.value.name.title} ${profileController.user.value.name.first} ${profileController.user.value.name.last}",
                style: TextStyle(
                    fontSize: size.width / 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                profileController.user.value.email,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: size.width / 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5.5,
              ),
              Text(
                "${profileController.user.value.dob.age} years old",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: size.width / 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5.5,
              ),
              Text(
                "Phone : ${profileController.user.value.phone} , Cell : ${profileController.user.value.cell}",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: size.width / 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5.5,
              ),
              Text(
                "Address : ${profileController.user.value.location.country} , ${profileController.user.value.location.state} , ${profileController.user.value.location.city} , ${profileController.user.value.location.street.name}",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: size.width / 30,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
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
                          "30",
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
    });
  }
}

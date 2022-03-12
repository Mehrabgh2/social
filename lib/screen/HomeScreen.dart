import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social/api/Login.dart';
import 'package:social/db/DBProvider.dart';
import 'package:social/controller/UserProfileController.dart';
import 'package:social/page/LoginPage.dart';
import 'package:social/widget/HomeUserListView.dart';

class HomeScreen extends StatelessWidget {
  Function setPage;
  UserProfileController profileController = Get.find<UserProfileController>();
  late MainUserListView _mainUserListView;

  HomeScreen({required this.setPage});

  @override
  Widget build(BuildContext context) {
    _mainUserListView = MainUserListView();
    final size = MediaQuery.of(context).size;
    refreshData();
    return Scaffold(
      appBar: AppBar(title: const Text("Home"), actions: [
        IconButton(
          onPressed: () {
            Get.defaultDialog(
              radius: 10.0,
              contentPadding: const EdgeInsets.all(20),
              title: 'Logout',
              middleText: 'Are you sure to logout?',
              textConfirm: 'Confirm',
              textCancel: 'Cancel',
              confirm: OutlinedButton.icon(
                onPressed: () {
                  logout(DBProvider().getSettings().token).then(
                    (value) {
                      if (value.code == 200) {
                        Get.back();
                        Get.offAll(LoginPage());
                      }
                    },
                  );
                },
                icon: const Icon(
                  Icons.check,
                  color: Colors.blue,
                ),
                label: const Text(
                  'Confirm',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              cancel: OutlinedButton.icon(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.cancel),
                label: const Text("Cancel"),
              ),
            );
          },
          icon: const Icon(Icons.logout),
        ),
      ]),
      body: RefreshIndicator(
        onRefresh: refreshData,
        child: Column(
          children: [
            Obx(() {
              return Container(
                height: (size.height / 6),
                decoration: BoxDecoration(color: Colors.grey[100]),
                alignment: Alignment.center,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setPage(2);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                              profileController.user.value.picture.medium),
                        ),
                        const SizedBox(width: 25),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "${profileController.user.value.name.title} ${profileController.user.value.name.first} ${profileController.user.value.name.last}",
                              style: TextStyle(fontSize: size.height / 45),
                            ),
                            Text(
                              profileController.user.value.email,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: size.height / 45),
                            ),
                            Text(
                              profileController.user.value.phone,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: size.height / 45),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
            _mainUserListView,
          ],
        ),
      ),
    );
  }

  Future<void> refreshData() async {
    profileController.mockUser();
    profileController.getMyUser();
    _mainUserListView.refresh();
  }
}

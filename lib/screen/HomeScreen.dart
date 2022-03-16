import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social/api/Login.dart';
import 'package:social/controller/FollowingController.dart';
import 'package:social/db/SettingDBProvider.dart';
import 'package:social/controller/UserProfileController.dart';
import 'package:social/page/LoginPage.dart';
import 'package:social/widget/FollowingListView.dart';
import 'package:social/widget/HomeUserListView.dart';

class HomeScreen extends StatelessWidget {
  Function setPage;
  UserProfileController profileController = Get.find<UserProfileController>();
  FollowingController followingController = Get.find<FollowingController>();
  late MainUserListView _mainUserListView;
  late FollowingListView _followingListView;
  late Widget usersScreen;
  late Widget followingScreen;
  Function mainSetItemsFollow;

  HomeScreen({required this.setPage, required this.mainSetItemsFollow});

  @override
  Widget build(BuildContext context) {
    followingController.updateFollowing();
    final size = MediaQuery.of(context).size;
    _mainUserListView = MainUserListView();
    _followingListView = FollowingListView(
      setItemsFollow: setItemsFollow,
    );
    initWidgets(size);
    refreshData();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            title: const Text("Home"),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Users'),
                Tab(
                  text: 'Following',
                ),
              ],
            ),
            actions: [
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
                        logout(SettingDBProvider().getSettings().token).then(
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
        body: TabBarView(children: [usersScreen, followingScreen]),
      ),
    );
  }

  Future<void> refreshData() async {
    profileController.mockUser();
    profileController.getMyUser();
    _mainUserListView.refresh();
  }

  void setItemsFollow() {
    _mainUserListView.setItemsFollow();
    mainSetItemsFollow;
  }

  void initWidgets(Size size) {
    usersScreen = RefreshIndicator(
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
                  padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
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
                                color: Colors.grey, fontSize: size.height / 45),
                          ),
                          Text(
                            profileController.user.value.phone,
                            style: TextStyle(
                                color: Colors.grey, fontSize: size.height / 45),
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
    );
    followingScreen = Column(children: [
      Expanded(
        child: _followingListView,
      )
    ]);
  }
}

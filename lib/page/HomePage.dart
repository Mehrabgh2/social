import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social/screen/ExploreScreen.dart';
import 'package:social/screen/HomeScreen.dart';
import 'package:social/screen/MyProfileScreen.dart';

class HomePage extends StatelessWidget {
  late List<Widget> navigators;
  int selectedIndex = 0;
  final homePageController = Get.put(HomePageController());
  late var _homeNavigator;
  late var _exploreNavigator;
  late var _myProfileScreen;

  HomePage() {
    _homeNavigator = HomeScreen(
        setPage: homePageController.updatePageIndex,
        mainSetItemsFollow: setItemsFollow);
    _exploreNavigator = ExploreScreen();
    _myProfileScreen = MyProfileScreen(setItemsFollow: setItemsFollow);
    navigators = [_homeNavigator, _exploreNavigator, _myProfileScreen];
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: homePageController.pageIndex.value,
          children: navigators,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Explore"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: "Profile")
          ],
          currentIndex: homePageController.pageIndex.value,
          onTap: homePageController.updatePageIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      );
    });
  }

  void setItemsFollow() {
    _homeNavigator.setItemsFollow();
  }
}

class HomePageController extends GetxController {
  var pageIndex = 0.obs;

  updatePageIndex(int index) {
    pageIndex(index);
  }
}

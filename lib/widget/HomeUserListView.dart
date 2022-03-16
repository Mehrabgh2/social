import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:social/db/FollowedDBProvider.dart';
import 'package:social/model/User.dart';
import 'package:social/repository/HomeUserListRepository.dart';
import 'package:social/widget/MainUserRowWidget.dart';

class MainUserListView extends StatelessWidget {
  int _pageSize = 20;
  HomeUserListReposiyory userListRepository = HomeUserListReposiyory();
  final HomeUserListViewPagingController homeUserListViewPagingController =
      Get.put(HomeUserListViewPagingController());
  late PagingController<int, MainUserRowWidget> controller;

  @override
  Widget build(BuildContext context) {
    controller = homeUserListViewPagingController.pagingController.value;
    controller.addPageRequestListener((pageKey) {
      userListRepository.getHomeUserList(
          count: 20,
          page: pageKey,
          appendPage: appendPage,
          appendLastPage: appendLastPage);
    });
    homeUserListViewPagingController.updatePaging(controller);
    return Obx(() {
      return Expanded(
        child: PagedListView<int, MainUserRowWidget>(
          pagingController:
              homeUserListViewPagingController.pagingController.value,
          builderDelegate: PagedChildBuilderDelegate<MainUserRowWidget>(
              itemBuilder: (context, item, index) {
            return MainUserRowWidget(
              user: item.user,
            );
          }),
        ),
      );
    });
  }

  void setItemsFollow() {
    if (controller.itemList != null) {
      for (var item in controller.itemList!) {
        if (FollowedDBProvider.instance.containUser(item.user.email)) {
          item.user.followController.updateFollow(true);
        } else {
          item.user.followController.updateFollow(false);
        }
      }
    }
  }

  void appendPage(List<User> items) {
    _pageSize += 20;
    List<MainUserRowWidget> widgetItems = List.generate(
        items.length, (index) => MainUserRowWidget(user: items[index]));
    homeUserListViewPagingController.pagingController.value
        .appendPage(widgetItems, _pageSize);
  }

  void appendLastPage(List<User> items) {
    List<MainUserRowWidget> widgetItems = List.generate(
        items.length, (index) => MainUserRowWidget(user: items[index]));
    homeUserListViewPagingController.pagingController.value
        .appendLastPage(widgetItems);
  }

  void refresh() {
    homeUserListViewPagingController.pagingController.value =
        PagingController(firstPageKey: 1);
    _pageSize = 20;
    PagingController<int, MainUserRowWidget> controller =
        homeUserListViewPagingController.pagingController.value;
    controller.addPageRequestListener((pageKey) {
      userListRepository.getHomeUserList(
          count: 20,
          page: pageKey,
          appendPage: appendPage,
          appendLastPage: appendLastPage);
    });
    homeUserListViewPagingController.updatePaging(controller);
    userListRepository.getHomeUserList(
        count: 20,
        page: 1,
        appendPage: appendPage,
        appendLastPage: appendLastPage);
  }
}

class HomeUserListViewPagingController {
  var pagingController =
      PagingController<int, MainUserRowWidget>(firstPageKey: 1).obs;

  updatePaging(
      PagingController<int, MainUserRowWidget> settedPagingController) {
    pagingController(settedPagingController);
  }
}

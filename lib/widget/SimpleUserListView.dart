import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:social/model/User.dart';
import 'package:social/repository/SimpleUserListRepository.dart';
import 'package:social/widget/SimpleUserRowWidget.dart';

class SimpleUserListView extends StatelessWidget {
  int count;
  int _pageSize = 20;
  late int remain;
  SimpleUserListRepository userListRepository =
      Get.put(SimpleUserListRepository());
  PagingController<int, SimpleUserRowWidget> _pagingController =
      PagingController(firstPageKey: 1);
  bool firstRun = true;

  SimpleUserListView({required this.count}) {
    remain = count;
  }

  @override
  Widget build(BuildContext context) {
    _pagingController.addPageRequestListener((pageKey) {
      userListRepository.getCountedUserList(
          count: remain < 20 ? remain : 20,
          page: pageKey,
          appendPage: appendPage);
    });
    return Expanded(
      child: PagedListView<int, SimpleUserRowWidget>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<SimpleUserRowWidget>(
            itemBuilder: (context, item, index) {
          return SimpleUserRowWidget(
            user: item.user,
          );
        }),
      ),
    );
  }

  void appendPage(List<User> items) {
    remain -= items.length;
    _pageSize += items.length;
    _pagingController.addPageRequestListener((pageKey) {
      userListRepository.getCountedUserList(
          count: remain < 20 ? remain : 20,
          page: pageKey,
          appendPage: appendPage);
    });
    if (items.length < 20) {
      appendLastPage(items);
    } else {
      List<SimpleUserRowWidget> widgetItems = List.generate(
          items.length, (index) => SimpleUserRowWidget(user: items[index]));
      _pagingController.appendPage(widgetItems, _pageSize);
    }
  }

  void appendLastPage(List<User> items) {
    List<SimpleUserRowWidget> widgetItems = List.generate(
        items.length, (index) => SimpleUserRowWidget(user: items[index]));
    _pagingController.appendLastPage(widgetItems);
  }
}

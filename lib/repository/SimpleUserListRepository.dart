import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:social/api/GetUserApi.dart';
import 'package:social/model/MockUser.dart';
import 'package:social/model/UserList.dart';

class SimpleUserListRepository {
  UserList userList =
      UserList(results: List.generate(0, (index) => MockUser.getMockUser()));

  void getCountedUserList(
      {required int count, required int page, required Function appendPage}) {
    getCountedUser(count: count, page: page, appendPage: appendPage);
  }
}

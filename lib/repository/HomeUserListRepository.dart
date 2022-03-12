import 'package:social/api/GetUserApi.dart';
import 'package:social/model/MockUser.dart';
import 'package:social/model/UserList.dart';

class HomeUserListReposiyory {
  var userList =
      UserList(results: List.generate(0, (index) => MockUser.getMockUser()));

  void getHomeUserList(
      {required int count,
      required int page,
      required Function appendPage,
      required Function appendLastPage}) {
    getHomeUsers(
        count: count,
        page: page,
        appendPage: appendPage,
        appendLastPage: appendLastPage);
  }
}

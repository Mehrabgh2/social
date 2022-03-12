import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:social/controller/UserProfileController.dart';
import 'package:social/model/UserList.dart';

void getHomeUsers(
    {required int count,
    required int page,
    required Function appendPage,
    required Function appendLastPage}) async {
  try {
    final response = await http.get(Uri.parse(
        'https://randomuser.me/api/?seed=Mehrab&results=$count&page=$page'));
    if (response.statusCode == 200) {
      UserList list = UserList.fromJson(jsonDecode(response.body));
      if (list.results.length < count) {
        appendLastPage(list.results);
      } else {
        appendPage(list.results);
      }
    } else {
      throw Exception('Failed to load data');
    }
  } catch (err) {
    throw Exception(err.toString());
  }
}

void getCountedUser(
    {required int count,
    required int page,
    required Function appendPage}) async {
  try {
    final response = await http
        .get(Uri.parse('https://randomuser.me/api/?results=$count&page=$page'));
    if (response.statusCode == 200) {
      UserList list = UserList.fromJson(jsonDecode(response.body));
      appendPage(list.results);
    } else {
      throw Exception('Failed to load data');
    }
  } catch (err) {
    throw Exception(err.toString());
  }
}

void getMyProfile({required UserProfileController controller}) async {
  try {
    final response = await http
        .get(Uri.parse('https://randomuser.me/api/?seed=MMMMM&results=1'));
    if (response.statusCode == 200) {
      controller.user(UserList.fromJson(jsonDecode(response.body)).results[0]);
    } else {
      throw Exception('Failed to load data');
    }
  } catch (err) {
    throw Exception(err.toString());
  }
}

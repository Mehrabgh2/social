import 'package:get/get.dart';
import 'package:social/api/GetUserApi.dart';
import 'package:social/model/MockUser.dart';
import 'package:social/model/User.dart';

class UserProfileController extends GetxController {
  var user = MockUser.getMockUser().obs;

  updateUser(User user) {
    this.user(user);
  }

  void getMyUser() {
    getMyProfile(controller: this);
  }

  void mockUser() {
    user(MockUser.getMockUser());
  }
}

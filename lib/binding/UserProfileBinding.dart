import 'package:get/get.dart';
import 'package:social/controller/FollowingController.dart';
import 'package:social/controller/UserProfileController.dart';

class UserProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserProfileController>(() => UserProfileController());
    Get.lazyPut<FollowingController>(() => FollowingController());
  }
}

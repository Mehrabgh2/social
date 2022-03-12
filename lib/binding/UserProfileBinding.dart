import 'package:get/get.dart';
import 'package:social/controller/UserProfileController.dart';

class UserProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserProfileController());
  }
}

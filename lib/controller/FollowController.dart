import 'package:get/get.dart';
import 'package:social/model/User.dart';

class FollowController extends GetxController {
  var followings = <User>[].obs;

  updateFollowing(List<User> newFollowings) {
    followings(newFollowings);
  }
}

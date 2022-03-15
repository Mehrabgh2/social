import 'package:get/get.dart';
import 'package:social/db/FollowedDBProvider.dart';
import 'package:social/model/User.dart';

class FollowingController extends GetxController {
  var followings = <User>[].obs;

  updateFollowing() {
    followings(FollowedDBProvider.instance.getFollowings());
    followings.refresh();
  }
}

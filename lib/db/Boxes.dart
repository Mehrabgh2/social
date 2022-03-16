import 'package:hive/hive.dart';

class Boxes {
  static Box<Map<dynamic, dynamic>> getFollowingBox() =>
      Hive.box<Map<dynamic, dynamic>>("following");
}

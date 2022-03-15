import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:social/db/FollowedDBProvider.dart';
import 'package:social/model/Dob.dart';
import 'package:social/model/Location.dart';
import 'package:social/model/Name.dart';
import 'package:social/model/Picture.dart';

part 'User.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  String gender;
  @HiveField(1)
  Name name;
  @HiveField(2)
  Location location;
  @HiveField(3)
  String email;
  @HiveField(4)
  Dob dob;
  @HiveField(5)
  String phone;
  @HiveField(6)
  String cell;
  @HiveField(7)
  Picture picture;
  @HiveField(8)
  String nat;
  @HiveField(9)
  FollowController followController = FollowController();

  updateFollowed(bool value) {
    followController.updateFollow(value);
  }

  User(
      {required this.gender,
      required this.name,
      required this.location,
      required this.email,
      required this.dob,
      required this.phone,
      required this.cell,
      required this.picture,
      required this.nat});

  Map<String, dynamic> toMap() {
    return {
      'gender': gender,
      'name': name.toMap(),
      'location': location.toMap(),
      'email': email,
      'dob': dob.toMap(),
      'phone': phone,
      'cell': cell,
      'picture': picture.toMap(),
      'nat': nat,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      gender: map['gender'] ?? '',
      name: Name.fromMap(Map.from(map['name'])),
      location: Location.fromMap(Map.from(map['location'])),
      email: map['email'] ?? '',
      dob: Dob.fromMap(Map.from(map['dob'])),
      phone: map['phone'] ?? '',
      cell: map['cell'] ?? '',
      picture: Picture.fromMap(Map.from(map['picture'])),
      nat: map['nat'] ?? '',
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    final gender = json['gender'];
    final name = (json['name'] != null ? Name.fromJson(json['name']) : null)!;
    final location = (json['location'] != null
        ? Location.fromJson(json['location'])
        : null)!;
    final email = json['email'];
    final dob = (json['dob'] != null ? Dob.fromJson(json['dob']) : null)!;
    final phone = json['phone'];
    final cell = json['cell'];
    final picture =
        (json['picture'] != null ? Picture.fromJson(json['picture']) : null)!;
    final nat = json['nat'];
    return User(
        gender: gender,
        name: name,
        location: location,
        email: email,
        dob: dob,
        phone: phone,
        cell: cell,
        picture: picture,
        nat: nat)
      ..followController = FollowController()
      ..updateFollowed(FollowedDBProvider.instance.containUser(json['email']));
  }
}

class FollowController extends GetxController {
  var followed = false.obs;
  updateFollow(bool follow) {
    followed(follow);
  }
}

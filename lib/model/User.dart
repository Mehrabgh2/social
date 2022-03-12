import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:social/model/Dob.dart';
import 'package:social/model/Location.dart';
import 'package:social/model/Name.dart';
import 'package:social/model/Picture.dart';

class User extends GetxController {
  String gender;
  Name name;
  Location location;
  String email;
  Dob dob;
  String phone;
  String cell;
  Picture picture;
  String nat;
  var followed = false.obs;

  updateFollowed(bool value) {
    followed(value);
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
        nat: nat);
  }
}

import 'package:social/model/Dob.dart';
import 'package:social/model/Location.dart';
import 'package:social/model/Name.dart';
import 'package:social/model/Picture.dart';
import 'package:social/model/Profile.dart';
import 'package:social/model/ServerUser.dart';
import 'package:social/model/Street.dart';
import 'package:social/model/User.dart';

class MockUser {
  static User getMockUser() {
    return User(
        gender: "",
        name: Name(title: "", first: "", last: ""),
        location: Location(
            street: Street(number: 202035, name: ""),
            city: "",
            state: "",
            country: "",
            postcode: ""),
        email: "",
        dob: Dob(date: "", age: 36),
        phone: "",
        cell: "",
        picture: Picture(medium: "", thumbnail: ""),
        nat: "");
  }

  static ServerUser getServerMockUser() {
    return ServerUser(
        accessToken: "",
        profile: Profile(
            mobile: "",
            email: "",
            username: "",
            name: "",
            surname: "",
            tel: "",
            description: "",
            avatar: "",
            type: "",
            city: "",
            province: "",
            country: "",
            timezone: "",
            balance: ""),
        code: 401);
  }
}

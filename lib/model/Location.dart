import 'Street.dart';

class Location {
  Street street;
  String city;
  String state;
  String country;
  var postcode;

  Location(
      {required this.street,
      required this.city,
      required this.state,
      required this.country,
      required this.postcode});

  factory Location.fromJson(Map<String, dynamic> json) {
    final street = (json['street'] != null ? Street.fromJson(json['street']) : null)!;
    final city = json['city'];
    final state = json['state'];
    final country = json['country'];
    final postcode = json['postcode'];
    return Location(street: street, city: city, state: state, country: country, postcode: postcode);
  }
}

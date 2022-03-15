import 'dart:convert';

import 'Street.dart';

class Location {
  Street street;
  String city;
  String state;
  String country;

  Location(
      {required this.street,
      required this.city,
      required this.state,
      required this.country});

  factory Location.fromJson(Map<String, dynamic> json) {
    final street =
        (json['street'] != null ? Street.fromJson(json['street']) : null)!;
    final city = json['city'];
    final state = json['state'];
    final country = json['country'];
    final postcode = json['postcode'];
    return Location(street: street, city: city, state: state, country: country);
  }

  Map<String, dynamic> toMap() {
    return {
      'street': street.toMap(),
      'city': city,
      'state': state,
      'country': country,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      street: Street.fromMap(Map.from(map['street'])),
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      country: map['country'] ?? '',
    );
  }
}

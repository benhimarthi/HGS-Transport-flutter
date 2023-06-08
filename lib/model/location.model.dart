import 'package:flutter/foundation.dart';

class Locations {
  String address;
  String name;
  double longitude;
  double latitude;
  Locations(
      {required this.address,
      required this.name,
      required this.latitude,
      required this.longitude});

  factory Locations.fromJson(json) {
    return Locations(
        address: json['formatted_address'],
        name: json['name'],
        latitude: json['geometry']['location']['lat'],
        longitude: json['geometry']['location']['lng']);
  }
}

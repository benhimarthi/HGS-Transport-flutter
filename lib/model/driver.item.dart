import 'package:google_maps_flutter/google_maps_flutter.dart';

class DriverItemModel {
  String imageLink;
  String mailAddress;
  String name;
  String licensePlate;
  String carModel;
  int distance;
  double note;
  String uid = "";
  int connectivityStatu;
  LatLng currentLocation;
  DriverItemModel(
      {required this.currentLocation,
      required this.connectivityStatu,
      required this.mailAddress,
      required this.name,
      required this.licensePlate,
      required this.carModel,
      required this.note,
      required this.imageLink,
      required this.distance});

  setDriverUid(String uid) {
    this.uid = uid;
  }

  factory DriverItemModel.fromJson(json) {
    return DriverItemModel(
        currentLocation:
            LatLng(json['currentLoc']['lat'], json['currentLoc']['long']),
        connectivityStatu: json['connectivityStatu'],
        mailAddress: json['email'],
        name: json['fullName'],
        licensePlate: json['licensePlate'],
        carModel: json['carModel'],
        note: json['note'],
        imageLink: json['profilePic'],
        distance: 0);
  }
}

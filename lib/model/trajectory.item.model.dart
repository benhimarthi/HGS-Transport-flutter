import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'location.model.dart';

class TrajectItemModel {
  Locations origine;
  Locations destination;
  double distance;
  double price;
  String date;
  String driverUID;
  String clientUID;

  TrajectItemModel(
      {required this.origine,
      required this.destination,
      required this.distance,
      required this.price,
      required this.date,
      required this.clientUID,
      required this.driverUID});

  factory TrajectItemModel.fromJson(json) {
    return TrajectItemModel(
        origine: Locations.fromJson(json["origine"]),
        destination: Locations.fromJson(json["destination"]),
        distance: json["distance"],
        price: json["price"],
        date: json["date"],
        clientUID: json["client_uid"],
        driverUID: json["driver_uid"]);
  }
}

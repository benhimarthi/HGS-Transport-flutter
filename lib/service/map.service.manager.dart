import 'package:chatty/model/location.model.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';
import '../shared/constants.dart';
import 'package:web_socket_channel/io.dart';
import 'package:http/http.dart' as http;

class MapServiceManager {
  static List<LatLng> polylineCoordinates = [];

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permission are denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          "Location permissions are permanently denied, we can not request your position");
    }
    return await Geolocator.getCurrentPosition();
  }

  void getPolyPoint(Locations origine, Locations destination) async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult polylineResult =
        await polylinePoints.getRouteBetweenCoordinates(
            Constants.googleMapsKey,
            PointLatLng(origine.latitude, origine.longitude),
            PointLatLng(destination.latitude, destination.longitude));
    if (polylineResult.points.isNotEmpty) {
      polylineResult.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      //setState(() {});
    }
  }

  Future<http.Response> fetchLocation({String name = "haysalam"}) {
    return http.get(Uri.parse(
        "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?fields=formatted_address%2Cname%2Crating%2Copening_hours%2Cgeometry&input=$name&inputtype=textquery&locationbias=circle%3A2000%4047.6918452%2C-122.2226413&key=AIzaSyBTN1WS3aHfDT6AmIzaV5ZdMDaR3w8ahqg"));
  }

  static List<Locations> rs = [];

  void locations(String name) {
    var result = fetchLocation(name: name);
    result.then((value) {
      //rs.clear();
      var data = json.decode(value.body);
      for (var item in data['candidates']) {
        rs.add(Locations.fromJson(item));
      }
    });
  }
}

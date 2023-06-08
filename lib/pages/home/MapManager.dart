import 'dart:async';
import 'package:chatty/helper/helper_function.dart';
import 'package:chatty/model/location.model.dart';
import 'package:chatty/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapManager extends StatefulWidget {
  Position currentPosition;
  MapManager({super.key, required this.currentPosition});

  @override
  State<MapManager> createState() =>
      _MapManagerState(currentPosition: currentPosition);
}

class _MapManagerState extends State<MapManager> {
  Position currentPosition;
  _MapManagerState({required this.currentPosition});
  final Completer<GoogleMapController> _controller = Completer();

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;
  static List<LatLng> polylineCoordinates = [];

  void _liveLocation() async {
    GoogleMapController googleMapController = await _controller.future;
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      currentPosition = position;
    });
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            zoom: 13.5,
            target:
                LatLng(currentPosition.latitude, currentPosition.longitude))));
    setState(() {});
  }

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(const ImageConfiguration(),
            "assets/images/profile_image/nsaruto_child.jpg")
        .then((icon) {
      currentLocationIcon = icon;
    });
    setState(() {});
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
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _liveLocation();
    setCustomMarkerIcon();
    if (HelperFunction.destinationPoint.address != "") {
      getPolyPoint(
          HelperFunction.departurePoint, HelperFunction.destinationPoint);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: unnecessary_null_comparison
      child: currentPosition != null
          ? GoogleMap(
              zoomControlsEnabled: false,
              compassEnabled: false,
              initialCameraPosition: CameraPosition(
                  target: LatLng(
                      currentPosition.latitude, currentPosition.longitude),
                  zoom: 13.5),
              markers: {
                /*Marker(
                    markerId: MarkerId("src"),
                    position: LatLng(HelperFunction.departurePoint.latitude,
                        HelperFunction.departurePoint.latitude)),
                Marker(
                    markerId: MarkerId("dst"),
                    position: LatLng(HelperFunction.destinationPoint.latitude,
                        HelperFunction.destinationPoint.latitude)),*/
                if (polylineCoordinates.isNotEmpty)
                  Marker(
                      markerId: const MarkerId("destination"),
                      //icon: currentLocationIcon,
                      position: polylineCoordinates.last),
                if (polylineCoordinates.isNotEmpty)
                  Marker(
                      markerId: const MarkerId("departure"),
                      //icon: currentLocationIcon,
                      position: polylineCoordinates.first),
                Marker(
                    markerId: const MarkerId("myPosition"),
                    //icon: currentLocationIcon,
                    position: LatLng(
                        currentPosition.latitude, currentPosition.longitude)),
              },
              polylines: {
                Polyline(
                    polylineId: const PolylineId("Route"),
                    points: polylineCoordinates,
                    color: Colors.blue,
                    width: 6),
              },
              onMapCreated: (mapController) {
                _controller.complete(mapController);
              },
            )
          : const Center(child: Text("Looading")),
    );
  }
}

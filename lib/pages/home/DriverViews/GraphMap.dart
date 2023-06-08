import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GraphMaps extends StatefulWidget {
  const GraphMaps({super.key});

  @override
  State<GraphMaps> createState() => _GraphMapsState();
}

class _GraphMapsState extends State<GraphMaps> {
  final Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          width: double.infinity,
          height: 300,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            margin: EdgeInsets.all(10),
            height: 10,
            width: 100,
            child: GoogleMap(
              compassEnabled: false,
              initialCameraPosition:
                  CameraPosition(target: LatLng(123, 231), zoom: 13.5),
              markers: {
                Marker(markerId: MarkerId("src"), position: LatLng(3546, 554)),
              },
              onMapCreated: (mapController) {
                _controller.complete(mapController);
              },
            ),
          ),
        ),
      ), /*GoogleMap(
        compassEnabled: false,
        initialCameraPosition:
            CameraPosition(target: LatLng(123, 231), zoom: 13.5),
        markers: {
          /*Marker(
                    markerId: MarkerId("src"),
                    position: LatLng(HelperFunction.departurePoint.latitude,
                        HelperFunction.departurePoint.latitude)),
                Marker(
                    markerId: MarkerId("dst"),
                    position: LatLng(HelperFunction.destinationPoint.latitude,
                        HelperFunction.destinationPoint.latitude)),
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
                        currentPosition.latitude, currentPosition.longitude)),*/
        },
        onMapCreated: (mapController) {
          _controller.complete(mapController);
        },
      ),*/
    );
  }
}

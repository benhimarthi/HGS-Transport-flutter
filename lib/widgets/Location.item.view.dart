import 'package:chatty/model/location.model.dart';
import 'package:flutter/material.dart';

class LocationItemView extends StatelessWidget {
  Locations loc;
  LocationItemView({super.key, required this.loc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      height: 70,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: ListTile(
        title: Text(loc.name),
        subtitle: Text(loc.address),
      ),
    );
  }
}

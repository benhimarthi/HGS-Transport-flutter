import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/location.model.dart';

class HB extends StatefulWidget {
  const HB({super.key});

  @override
  State<HB> createState() => _HBState();
}

class _HBState extends State<HB> {
  Future<http.Response> fetchLocation(String location) {
    var h = {"Access-Control-Allow-Origin": "*"};
    return http
        .get(Uri.parse("http://localhost:8087/api/geocode?address=casa"));
  }

  List<Locations> rs = [];
  void locations(String name) {
    var result = fetchLocation("hayassani");
    result.then((value) {
      print(value.body);
      var data = json.decode(value.body);
      for (var item in data['candidates']) {
        rs.add(Locations.fromJson(item));
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var l = locations('cas');
    if (rs.isNotEmpty) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebSocket Demo'),
      ),
      body: Container(
        child: MaterialButton(
          onPressed: () {
            setState(() {
              //print(rs[0].address);
            });
          },
          child: const Text("press"),
        ),
      ),
    );
  }
}

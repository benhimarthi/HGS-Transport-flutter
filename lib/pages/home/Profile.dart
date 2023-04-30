import 'dart:io';

import 'package:chatty/pages/home/ProfileBody.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<void> getInfos() async {
    //http.Response
    //var url = "http://localhost:8088/geocode?address=haysalm";
    //var resp = await http.get(Uri.parse(url)); //Uri.http("localhost:8088", "/geocode", {"address": "haysalam"})
    //Uri.http("localhost:8088", "/geocode", {"address": "haysalam"});
    final client = HttpClient();
    final request = await client
        .getUrl(Uri.parse('http://localhost:8088/geocode?address=haysalm'));
    final response = await request.close();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInfos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Visibility(
          visible: false,
          child: Container(
            width: MediaQuery.of(context).size.width * .96,
            height: 250,
            decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.all(Radius.circular(15))),
          )),
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(
              color: Color.fromARGB(255, 76, 76, 76),
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 53, 181, 222),
          ),
          onPressed: () {},
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          MaterialButton(
            onPressed: () {},
            child: Container(
              padding: const EdgeInsets.all(3),
              width: MediaQuery.of(context).size.width * .3,
              height: 35,
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: const Center(
                child: Text(
                  "Deconnexion",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
      body: ProfileBody(),
    );
  }
}

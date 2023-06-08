import 'dart:math';

import 'package:chatty/helper/helper_function.dart';
import 'package:chatty/model/note.indicator.conf.dart';
import 'package:chatty/pages/home/DriverViews/CustomProgressBar.dart';
import 'package:chatty/pages/home/DriverViews/DriverNoteView.dart';
import 'package:chatty/pages/home/DriverViews/NoteIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../model/comment.item.model.dart';
import '../../../widgets/widgets.dart';
import '../CommentItem.dart';
import '../EditUserProfile.dart';

class DriverSProfile extends StatefulWidget {
  const DriverSProfile({super.key});

  @override
  State<DriverSProfile> createState() => _DriverSProfileState();
}

class _DriverSProfileState extends State<DriverSProfile> {
  double _volumeValue = .5;
  var noteRp = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Driver profile",
            style: TextStyle(color: Color.fromARGB(255, 53, 181, 222)),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 182, 206, 225),
        ),
        body: Container(
            color: const Color.fromARGB(255, 182, 206, 225),
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                        //color: Color.fromARGB(140, 255, 255, 255),
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(40))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage(
                              "assets/images/profile_image/anies.jpg"),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                HelperFunction.userInformations.mailAddress,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 53, 181, 222),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                HelperFunction.userInformations.name,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w100,
                                    color: Colors.grey),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                nextScreen(context, const EditUserProfile());
                              },
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                width: MediaQuery.of(context).size.width * .3,
                                height: 35,
                                decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromARGB(
                                              255, 106, 106, 106),
                                          blurRadius: .5,
                                          offset: Offset(.08, .7))
                                    ],
                                    color: Color.fromARGB(255, 53, 181, 222),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                child: const Center(
                                  child: Text(
                                    "Edit profile",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(left: 10, top: 15),
                        child: const Text(
                          "Car Informations",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 130, 130, 130)),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            //color: Color.fromARGB(195, 255, 193, 7),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(TextSpan(
                                    text: "License plate : ",
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "82400",
                                        style: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 46, 46, 46),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14))),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text.rich(TextSpan(
                                    text: "Car model : ",
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "Hundai",
                                        style: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 46, 46, 46),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14))),
                              ],
                            ),
                            const Icon(
                              Icons.local_taxi,
                              size: 60,
                              color: Color.fromARGB(255, 53, 181, 222),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(left: 10, top: 15),
                        child: const Text(
                          "Note",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 130, 130, 130)),
                        ),
                      ),
                      const DriverNoteView(),
                      Column(
                        children: [
                          Container(
                            //color: Colors.amber,
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Opinions",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color.fromARGB(255, 130, 130, 130)),
                                ),
                                GestureDetector(
                                  child: const Text(
                                    "See more...",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 53, 181, 222)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .55,
                            child: ListView(
                              children: [
                                CommentItem(
                                  commentItemModel: CommentItemModel(
                                      authorUID: "",
                                      mailAddress: "b.marthi@mundiapolis.ma",
                                      date: "05/04/2023",
                                      content:
                                          "For information on recommended devices and specifications, as well as Android Emulator support, visit chromeos.dev.",
                                      name: "ranies"),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}

import 'package:chatty/model/comment.item.model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../model/driver.item.dart';
import '../../service/database_service.dart';
import '../../widgets/widgets.dart';
import 'CommentItem.dart';
import 'EditUserProfile.dart';

class DriverProfile extends StatefulWidget {
  DriverItemModel driverItem;
  DriverProfile({super.key, required this.driverItem});

  @override
  State<DriverProfile> createState() => _DriverProfileState();
}

var userNote = 0;

class _DriverProfileState extends State<DriverProfile> {
  late DatabaseService databaseService;
  late FirebaseStorage storage;
  String url = "";

  Future<void> setImg(ref) async {
    url = await ref.getDownloadURL();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databaseService = DatabaseService(uid: widget.driverItem.uid);
    storage = FirebaseStorage.instance;

    if (widget.driverItem.imageLink != "") {
      Reference ref = storage.ref().child(widget.driverItem.imageLink);
      setImg(ref);
    }
  }

  @override
  Widget build(BuildContext context) {
    var noteRp = widget.driverItem.note;

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
                      color: Color.fromARGB(140, 255, 255, 255),
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(40))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      widget.driverItem.imageLink == "" || url == ""
                          ? GestureDetector(
                              onTap: () {},
                              child: const CircleAvatar(
                                radius: 60,
                                child: Icon(
                                  Icons.account_circle_sharp,
                                  size: 120,
                                  color: Color.fromARGB(115, 255, 255, 255),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                setState(() {});
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                //color: Colors.amber,
                                decoration: const BoxDecoration(
                                    //color: Colors.amber,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                child: ClipOval(
                                    child: Image.network(
                                  url,
                                  fit: BoxFit.fill,
                                )),
                              ),
                            ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              widget.driverItem.mailAddress,
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
                              widget.driverItem.name,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w100,
                                  color: Colors.grey),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: List.generate(5, (index) {
                                  var ic = Icon(
                                    noteRp > 0
                                        ? (noteRp > 0.5
                                            ? Icons.star
                                            : Icons.star_half_sharp)
                                        : Icons.star_border,
                                    color:
                                        noteRp > 0 ? Colors.amber : Colors.grey,
                                  );
                                  noteRp -= 1;
                                  return ic;
                                }),
                              ),
                            ],
                          ),
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
                          color: Color.fromARGB(195, 255, 193, 7),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
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
                                      text: widget.driverItem.licensePlate,
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
                                      text: widget.driverItem.carModel,
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
                                    color: Color.fromARGB(255, 130, 130, 130)),
                              ),
                              GestureDetector(
                                child: const Text(
                                  "See more...",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 53, 181, 222)),
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
                                  name: "jamie frost",
                                ),
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
          )),
    );
  }
}

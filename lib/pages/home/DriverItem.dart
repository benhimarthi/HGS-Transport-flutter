import 'package:chatty/model/driver.item.dart';
import 'package:chatty/pages/home/DriverProfile.dart';
import 'package:chatty/widgets/widgets.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../service/database_service.dart';

class DriverItem extends StatefulWidget {
  DriverItemModel driverItem;
  DriverItem({super.key, required this.driverItem});

  @override
  State<DriverItem> createState() => _DriverItemState(driverItem);
}

class _DriverItemState extends State<DriverItem> {
  bool showConductorDetails = false;
  DriverItemModel driverItem;
  late DatabaseService databaseService;
  late FirebaseStorage storage;
  String url = "";

  _DriverItemState(this.driverItem);

  Future<void> setImg(ref) async {
    url = await ref.getDownloadURL();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databaseService = DatabaseService(uid: driverItem.uid);
    storage = FirebaseStorage.instance;

    if (driverItem.imageLink != "") {
      Reference ref = storage.ref().child(driverItem.imageLink);
      setImg(ref);
    }
  }

  @override
  Widget build(BuildContext context) {
    double noteRp = driverItem.note;
    return Container(
      //color: const Color.fromARGB(255, 53, 181, 222),
      margin: const EdgeInsets.all(5),
      width: double.infinity,
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  showConductorDetails =
                      showConductorDetails == true ? false : true;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * .95,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 225, 225, 225),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        driverItem.imageLink == "" || url == ""
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  child: ClipOval(
                                      child: Image.network(
                                    url,
                                    fit: BoxFit.fill,
                                  )),
                                ),
                              ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                nextScreen(
                                    context,
                                    DriverProfile(
                                      driverItem: driverItem,
                                    ));
                              },
                              child: Text(
                                driverItem.mailAddress,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 53, 181, 222),
                                    fontSize: 20),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              driverItem.name,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
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
                            const SizedBox(
                              height: 10,
                            ),
                            Text.rich(TextSpan(
                                text: "Distance : ",
                                children: <TextSpan>[
                                  TextSpan(
                                    text: driverItem.distance.toString(),
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        decoration: TextDecoration.underline),
                                  )
                                ],
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 46, 46, 46),
                                    fontSize: 14)))
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Visibility(
                        visible: showConductorDetails,
                        child: Column(
                          children: [
                            const Text(
                              "Car Informations",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 130, 130, 130)),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  //mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text.rich(TextSpan(
                                        text: "License plate : ",
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: driverItem.licensePlate,
                                            style: const TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                        style: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 46, 46, 46),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14))),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text.rich(TextSpan(
                                        text: "Car model : ",
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: driverItem.carModel,
                                            style: const TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                        style: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 46, 46, 46),
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
                            const SizedBox(
                              height: 15,
                            ),
                            MaterialButton(
                              onPressed: () {},
                              child: Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width * .4,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(255, 53, 181, 222),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Call the driver",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:chatty/helper/helper_function.dart';
import 'package:chatty/model/driver.item.dart';
import 'package:chatty/pages/home/ConfigureTrajectory.dart';
import 'package:chatty/pages/home/DriverItem.dart';
import 'package:chatty/service/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'Home.dart';

class CallDriver extends StatefulWidget {
  const CallDriver({super.key});
  @override
  State<CallDriver> createState() => _CallDriverState();
}

class _CallDriverState extends State<CallDriver> {
  bool showFilter = false;
  List<DriverItemModel> drivers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DatabaseService(uid: HelperFunction.userInformations.uid)
        .findUserByHisStatut()
        .then((value) {
      for (var n in value.docs) {
        drivers.add(DriverItemModel.fromJson(n));
        drivers[drivers.length - 1].setDriverUid(n["uid"]);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Configure trajectory"),
        backgroundColor: const Color.fromARGB(255, 182, 206, 225),
      ),
      bottomSheet: Container(
        color: const Color.fromARGB(255, 182, 206, 225),
        //margin: const EdgeInsets.all(5),
        width: double.infinity,
        //height: 50,
        child: MaterialButton(
          onPressed: () {
            setState(() {});
          },
          child: Container(
            width: MediaQuery.of(context).size.width * .8,
            margin: const EdgeInsets.all(5),
            height: 50,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 53, 181, 222),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: const Padding(
              padding: EdgeInsets.all(3),
              child: Center(
                child: Text(
                  "Call drivers",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 182, 206, 225),
          //borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: const Color.fromARGB(255, 53, 181, 222),
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50))),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            showFilter = showFilter == true ? false : true;
                          });
                        },
                        child: Row(
                          children: [
                            const Text(
                              "Filter",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 53, 181, 222)),
                            ),
                            !showFilter
                                ? const Icon(
                                    Icons.arrow_drop_down,
                                    color: Color.fromARGB(255, 53, 181, 222),
                                  )
                                : const Icon(
                                    Icons.close,
                                    color: Color.fromARGB(255, 53, 181, 222),
                                  )
                          ],
                        ),
                      ),
                    ),
                    const Text(
                      "Most close",
                      style:
                          TextStyle(color: Color.fromARGB(255, 53, 181, 222)),
                    )
                  ],
                ),
                Visibility(
                    visible: showFilter,
                    child: Container(
                        //color: Colors.green,
                        margin: const EdgeInsets.all(5),
                        width: double.infinity,
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Checkbox(value: true, onChanged: (vl) {}),
                                const Text("Most close")
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(value: false, onChanged: (vl) {}),
                                const Text("Best rate")
                              ],
                            )
                          ],
                        ))),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .7,
                  //color: Colors.amber,
                  child: ListView(
                      children: List.generate(drivers.length, (index) {
                    return DriverItem(driverItem: drivers[index]);
                  })),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:chatty/helper/helper_function.dart';
import 'package:chatty/model/location.model.dart';
import 'package:chatty/pages/home/CallConductor.dart';
import 'package:chatty/pages/home/MapManager.dart';
import 'package:chatty/pages/search_page.dart';
import 'package:chatty/service/map.service.manager.dart';
import 'package:chatty/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';

import '../../widgets/TextInput.dart';
import 'Home.dart';

class ConfigureTrajectory extends StatefulWidget {
  const ConfigureTrajectory({super.key});

  @override
  State<ConfigureTrajectory> createState() => _ConfigureTrajectoryState();
}

late Position departurePL;
late Position targetPL;

class _ConfigureTrajectoryState extends State<ConfigureTrajectory>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    HelperFunction.departurePoint = HelperFunction.userLocation;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  static String departurePoint = "My Position";
  static String targetPoint = "Destination";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
          padding: const EdgeInsets.all(5),
          child: Center(
              child: Container(
            width: MediaQuery.of(context).size.width * .95,
            decoration: const BoxDecoration(
                color: Color.fromARGB(93, 255, 255, 255),
                boxShadow: [],
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Center(
                  child: Text(
                    "Configure the Trajectory",
                    style: TextStyle(
                        color: Color.fromARGB(255, 80, 80, 80),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .8,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: ListTile(
                    title: GestureDetector(
                      onTap: () => nextScreen(
                          context,
                          Search(
                            act: "cp",
                          )),
                      child: SizedBox(
                        height: 20,
                        //decoration: const BoxDecoration(color: Colors.white),
                        child: Text(HelperFunction.departurePoint.address != ""
                            ? HelperFunction.departurePoint.address
                            : departurePoint),
                      ),
                    ),
                    leading: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 53, 181, 222),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: const Icon(
                        Icons.my_location,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .8,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: ListTile(
                    title: GestureDetector(
                      onTap: () => nextScreen(
                          context,
                          Search(
                            act: "dst",
                          )),
                      child: SizedBox(
                        height: 20,
                        //decoration: const BoxDecoration(color: Colors.white),
                        child: Text(
                            HelperFunction.destinationPoint.address != ""
                                ? HelperFunction.destinationPoint.address
                                : departurePoint),
                      ),
                    ),
                    leading: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 53, 181, 222),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: const Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .8,
                  decoration: const BoxDecoration(
                    //color: Color.fromARGB(255, 239, 239, 239),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(
                      "0.0 MAD",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 49, 49, 49)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .8,
                  child: const Text(
                    "This is the estimated price releted to the trajectory you defined.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      nextScreen(context, const CallDriver());
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * .8,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 53, 181, 222),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(3),
                      child: Center(
                        child: Text(
                          "Call a driver",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ))),
    );
  }
}

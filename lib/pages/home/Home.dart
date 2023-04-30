import 'package:chatty/pages/home/CallConductor.dart';
import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../widgets/widgets.dart';
import '../auth/UserProfile.dart';
import 'ConfigureTrajectory.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

double bottomSheetHeight = 460;

class _HomePageState extends State<HomePage> {
  bool t = true;
  bool showCallView = false;

  /*late GoogleMapController mapController;

  late final LatLng _center = const LatLng(45.521563, -122.677433);
  //late Position pos;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
*/
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_center = LatLng(pos.latitude, pos.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
          padding: const EdgeInsets.all(5),
          height: bottomSheetHeight,
          child: SingleChildScrollView(
              child: Column(
            children: [
              GestureDetector(
                  onVerticalDragEnd: (dr) {
                    setState(() {
                      if (bottomSheetHeight >= 210) {
                        bottomSheetHeight = 460;
                      } else {
                        bottomSheetHeight = 90;
                      }
                    });
                  },
                  onVerticalDragUpdate: (details) {
                    setState(() {
                      if (bottomSheetHeight <= 465 &&
                          details.delta.direction < 0) {
                        bottomSheetHeight -= 1.2 * details.delta.direction;
                      } else if (bottomSheetHeight >= 100 &&
                          details.delta.direction > 0) {
                        bottomSheetHeight -= 1.2 * details.delta.direction;
                      }
                    });
                  },
                  child: SizedBox(
                    height: 20,
                    child: Center(
                      child: Container(
                        height: 3,
                        width: MediaQuery.of(context).size.width * .1,
                        decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                      ),
                    ),
                  )),
              showCallView
                  ? const CallDriver()
                  : Column(
                      children: [
                        const ConfigureTrajectory(),
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              showCallView =
                                  showCallView == true ? false : true;
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * .8,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 53, 181, 222),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
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
                      ],
                    ),
            ],
          ))),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the UI based on the item selected
                // ...
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the UI based on the item selected
                // ...
              },
            ),
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: SizedBox(
          //color: Colors.black,
          width: 55,
          height: 150,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 53, 181, 222),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    /*boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 44, 44, 44),
                          offset: Offset(0, 2),
                          blurRadius: 2)
                    ],*/
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.gps_fixed_sharp,
                        color: Color.fromARGB(255, 255, 255, 255),
                      )),
                ),
                /*Visibility(
                    visible: t,
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: const BoxDecoration(
                          /*boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 44, 44, 44),
                            offset: Offset(0, 2),
                            blurRadius: 2)
                      ],*/
                          color: Color.fromARGB(255, 53, 181, 222),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: IconButton(
                          onPressed: () {
                            nextScreen(context, const PathEvaluator());
                          },
                          icon: const Icon(
                            Icons.assistant_direction_sharp,
                            color: Colors.white,
                          )),
                    ))*/
              ],
            ),
          )),
      /*persistentFooterButtons: t
          ? [
              SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                height: 55,
                child: Center(
                    child: MaterialButton(
                  onPressed: () {
                    nextScreen(context, const PathConfigured());
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width * .7,
                      decoration: const BoxDecoration(
                          /*boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 44, 44, 44),
                          offset: Offset(0, .5),
                          blurRadius: 1)
                    ],*/
                          color: Color.fromARGB(255, 53, 181, 222),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: const Center(
                        child: Text(
                          "Command a car",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                )),
              )
            ]
          : null,*/
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        actions: [
          Container(
            height: 90,
            width: MediaQuery.of(context).size.width * .88,
            //color: Colors.red,
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /*Container(
                  height: 45,
                  width: 45,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 44, 44, 44),
                            offset: Offset(0, 2),
                            blurRadius: 2)
                      ],
                      color: Color.fromARGB(255, 53, 181, 222),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Center(
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.menu)),
                  ),
                ),*/
                Container(
                  width: MediaQuery.of(context).size.width * .65,
                  height: 52,
                  //padding: EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 95, 95, 95),
                          offset: Offset(0, 2),
                          blurRadius: 2)
                    ],
                  ),
                  child: Center(
                    child: TextFormField(
                        onChanged: (val) {},
                        decoration: InputDecoration(
                          hintText: "Search palce",
                          border: InputBorder.none,
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.transparent,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {}, icon: const Icon(Icons.search)),
                        )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    nextScreen(context, const UserProfile());
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(
                        /* boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 44, 44, 44),
                              offset: Offset(0, 2),
                              blurRadius: 2)
                        ],*/
                        color: Color.fromARGB(255, 53, 181, 222),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Center(),
                  ),
                )
              ],
            ),
          )
        ],
        //leading: ,
      ),
      body: Container(
        color: Colors.amber,
      ), /*GoogleMap(
        myLocationEnabled: true,
        zoomControlsEnabled: false,
        //myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),*/
    );
  }
}

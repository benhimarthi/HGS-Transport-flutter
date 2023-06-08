import 'package:chatty/helper/helper_function.dart';
import 'package:chatty/pages/home/Home.dart';
import 'package:chatty/service/map.service.manager.dart';
import 'package:chatty/widgets/Location.item.view.dart';
import 'package:chatty/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';

import '../model/location.model.dart';

class Search extends StatefulWidget {
  String act;
  Search({super.key, required this.act});

  @override
  State<Search> createState() => _SearchState(this.act);
}

class _SearchState extends State<Search> {
  List<Locations> locs = [];
  MapServiceManager msm = MapServiceManager();
  String act;
  _SearchState(this.act);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MapServiceManager.rs.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 182, 206, 225),
      appBar: AppBar(
        flexibleSpace: Container(
          width: 100,
          height: 100,
          //color: Colors.amber,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          width: MediaQuery.of(context).size.width * .6,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: TextFormField(
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              suffixIcon: Icon(
                Icons.search,
                color: Color.fromARGB(255, 53, 181, 222),
              ),
              border: InputBorder.none,
              hintText: "Search a place",
            ),
            onChanged: (value) {
              setState(() {
                msm.locations(value);
                locs = MapServiceManager.rs;
                if (value.isEmpty) {
                  MapServiceManager.rs.clear();
                }
              });
            },
          ),
        ),
        centerTitle: true,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 5, right: 5),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 53, 181, 222),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: IconButton(
                  icon: const Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          //height: MediaQuery.of(context).size.height * .99,
          width: double.infinity,
          color: const Color.fromARGB(0, 255, 255, 255),
          margin: const EdgeInsets.all(5),
          child: Column(
              children: List.generate(
                  locs.length,
                  (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            switch (act) {
                              case "cp":
                                HelperFunction.departurePoint.address =
                                    locs[index].address;
                                HelperFunction.departurePoint.name =
                                    locs[index].name;
                                HelperFunction.departurePoint.longitude =
                                    locs[index].longitude;
                                HelperFunction.departurePoint.latitude =
                                    locs[index].latitude;
                                break;
                              case "dst":
                                HelperFunction.destinationPoint.address =
                                    locs[index].address;
                                HelperFunction.destinationPoint.name =
                                    locs[index].name;
                                HelperFunction.destinationPoint.longitude =
                                    locs[index].longitude;
                                HelperFunction.destinationPoint.latitude =
                                    locs[index].latitude;
                                msm.getPolyPoint(HelperFunction.departurePoint,
                                    HelperFunction.destinationPoint);
                                setState(() {});
                                break;
                              default:
                                HelperFunction.searchLocationResult.address =
                                    locs[index].address;
                                HelperFunction.searchLocationResult.name =
                                    locs[index].name;
                                HelperFunction.searchLocationResult.longitude =
                                    locs[index].longitude;
                                HelperFunction.searchLocationResult.latitude =
                                    locs[index].latitude;
                                break;
                            }
                            nextScreen(context, const HomePage());
                          });
                        },
                        child: LocationItemView(
                          loc: locs[index],
                        ),
                      ))),
        ),
      ),
    );
  }
}

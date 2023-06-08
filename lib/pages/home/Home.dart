import 'package:chatty/helper/helper_function.dart';
import 'package:chatty/model/comment.item.model.dart';
import 'package:chatty/model/driver.item.dart';
import 'package:chatty/pages/home/CallConductor.dart';
import 'package:chatty/pages/home/CommentView.dart';
import 'package:chatty/pages/home/DrawerMenu.dart';
import 'package:chatty/pages/home/DriverItem.dart';
import 'package:chatty/pages/home/MapManager.dart';
import 'package:chatty/pages/home/Profile.dart';
import 'package:chatty/pages/search_page.dart';
import 'package:chatty/service/map.service.manager.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../../service/database_service.dart';
import '../../widgets/widgets.dart';
import '../auth/UserProfile.dart';
import 'ConfigureTrajectory.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

late double bottomSheetHeight;
bool showCallView = false;
Position? currentLocation;

class _HomePageState extends State<HomePage> {
  bool showBottomView = true;
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
    MapServiceManager().getCurrentLocation().then((value) {
      currentLocation = value;
      HelperFunction.userLocation.latitude = value.latitude;
      HelperFunction.userLocation.longitude = value.longitude;
      HelperFunction.departurePoint = HelperFunction.userLocation;
    });

    bottomSheetHeight = 430;

    databaseService = DatabaseService(uid: HelperFunction.userInformations.uid);
    storage = FirebaseStorage.instance;

    if (HelperFunction.userInformations.imageLink != "") {
      Reference ref =
          storage.ref().child(HelperFunction.userInformations.imageLink);
      setImg(ref);
    }
  }

  @override
  Widget build(BuildContext context) {
    Reference ref =
        storage.ref().child(HelperFunction.userInformations.imageLink);
    setImg(ref);
    return Scaffold(
      bottomSheet: Container(
          color: const Color.fromARGB(
              182, 182, 206, 225), //const Color.fromARGB(255, 182, 206, 225)
          padding: const EdgeInsets.all(5),
          height: bottomSheetHeight,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 0),
                height: MediaQuery.of(context).size.height * .04,
                width: MediaQuery.of(context).size.width * .2,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    //color: Color.fromARGB(255, 53, 181, 222),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(182, 199, 221, 239),
                          Color.fromARGB(255, 65, 195, 238)
                        ])),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        showBottomView = showBottomView ? false : true;
                        if (showBottomView) {
                          bottomSheetHeight =
                              MediaQuery.of(context).size.height * .56;
                        } else {
                          bottomSheetHeight =
                              MediaQuery.of(context).size.height * .2;
                        }
                      });
                    },
                    icon: Icon(
                      showBottomView
                          ? Icons.arrow_drop_down
                          : Icons.arrow_drop_up,
                      color: Colors.white,
                    )),
              ),
              Container(
                //height: MediaQuery.of(context).size.height * .,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: showBottomView
                    ? const ConfigureTrajectory()
                    : MaterialButton(
                        onPressed: () {
                          setState(() {
                            setState(() {
                              showBottomView = showBottomView ? false : true;
                              if (showBottomView) {
                                bottomSheetHeight =
                                    MediaQuery.of(context).size.height * .56;
                              } else {
                                bottomSheetHeight =
                                    MediaQuery.of(context).size.height * .2;
                              }
                            });
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
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
              )
            ],
          )),
      drawer: const Drawer(child: DrawerMenu()),
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
                  ),
                  child: IconButton(
                      onPressed: () {
                        var dir = DatabaseService(
                                uid: HelperFunction.userInformations.uid)
                            .findUserByHisStatut()
                            .then((value) {
                          nextScreen(
                              context,
                              CommentView(
                                commentModel:
                                    DriverItemModel.fromJson(value.docs[0]),
                              ));
                        });
                      },
                      icon: const Icon(
                        Icons.gps_fixed_sharp,
                        color: Color.fromARGB(255, 255, 255, 255),
                      )),
                ),
              ],
            ),
          )),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        actions: [
          Container(
            height: 90,
            width: MediaQuery.of(context).size.width * .3,
            //color: Colors.red,
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 42, //MediaQuery.of(context).size.width * .65,
                  height: 42,
                  //padding: EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    /*boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 95, 95, 95),
                          offset: Offset(0, 2),
                          blurRadius: 2)
                    ],*/
                  ),
                  child: Center(
                    child: IconButton(
                      icon: const Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 53, 181, 222),
                      ),
                      onPressed: () => nextScreen(
                          context,
                          Search(
                            act: 'rd',
                          )),
                    ),
                  ),
                ),
                HelperFunction.userInformations.imageLink == "" || url == ""
                    ? GestureDetector(
                        onTap: () {
                          nextScreen(context, const Profile());
                        },
                        child: const CircleAvatar(
                          //radius: 60,
                          /*backgroundImage:
                        AssetImage("assets/images/profile_image/naruto.jpg"),*/
                          child: Icon(
                            Icons.account_circle_sharp,
                            //size: 120,
                            color: Color.fromARGB(115, 255, 255, 255),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            nextScreen(context, const Profile());
                          });
                        },
                        child: CircleAvatar(
                          child: ClipOval(
                              child: Image.network(
                            url,
                            fit: BoxFit.fill,
                          )),
                        ),
                      )
              ],
            ),
          )
        ],
        //leading: ,
      ),
      body: currentLocation == null
          ? Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor),
            )
          : MapManager(
              currentPosition: currentLocation!,
            ),
    );
  }
}

import 'package:chatty/pages/home/ProfileBody.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../helper/helper_function.dart';
import '../../service/database_service.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
        centerTitle: true,
        title: const Text(
          "Home",
          style: TextStyle(
              color: Color.fromARGB(255, 76, 76, 76),
              fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 182, 206, 225),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.logout,
                color: Colors.red,
              ))
        ],
      ),
      body: ProfileBody(imgUrl: url),
    );
  }
}

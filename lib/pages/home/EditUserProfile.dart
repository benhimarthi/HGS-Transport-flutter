import 'dart:io';

import 'package:chatty/helper/galeryImage.dart';
import 'package:chatty/pages/home/EditUserField.dart';
import 'package:chatty/service/database_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../helper/helper_function.dart';

class EditUserProfile extends StatefulWidget {
  const EditUserProfile({super.key});

  @override
  State<EditUserProfile> createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
  late DatabaseService databaseService;
  late FirebaseStorage storage;
  late String url;

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

    url = "";
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
        appBar: AppBar(
          title: const Text(
            "Edit profile",
            style: TextStyle(color: Color.fromARGB(255, 53, 181, 222)),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 182, 206, 225),
        ),
        body: Container(
          color: const Color.fromARGB(255, 182, 206, 225),
          height: double.infinity,
          child: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 53, 181, 222),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    HelperFunction.userInformations.imageLink == ""
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                ImageSelect.getImage().then((value) {
                                  File img = File(value!.path);
                                  databaseService.uploadPic(img);
                                  databaseService.updateValueInTable(
                                      HelperFunction.userInformations.uid,
                                      "profilePic",
                                      img.path.split('/').last);
                                  HelperFunction.userInformations.imageLink =
                                      img.path.split('/').last;
                                  Reference ref = storage.ref().child(
                                      HelperFunction
                                          .userInformations.imageLink);
                                  setImg(ref);
                                });
                              });
                              setState(() {});
                            },
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
                              setState(() {
                                setState(() {
                                  ImageSelect.getImage().then((value) {
                                    File img = File(value!.path);
                                    databaseService.uploadPic(img);
                                    databaseService.updateValueInTable(
                                        HelperFunction.userInformations.uid,
                                        "profilePic",
                                        img.path.split('/').last);
                                    HelperFunction.userInformations.imageLink =
                                        img.path.split('/').last;
                                    Reference ref = storage.ref().child(
                                        HelperFunction
                                            .userInformations.imageLink);
                                    setImg(ref);
                                  });
                                });
                              });
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
                            HelperFunction.userInformations.mailAddress,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            HelperFunction.userInformations.name,
                            textAlign: TextAlign.right,
                            style: const TextStyle(fontWeight: FontWeight.w100),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              EditUserField(
                db_field: "fullName",
                defaultTitle: "Full name",
                fieldValue: HelperFunction.userInformations.name,
                trailing: const Icon(
                  Icons.account_circle,
                  color: Color.fromARGB(255, 53, 181, 222),
                ),
                leading: const Icon(
                  Icons.edit,
                  color: Color.fromARGB(255, 53, 181, 222),
                ),
                isPassword: false,
              ),
              EditUserField(
                db_field: "email",
                defaultTitle: "Mail address",
                fieldValue: HelperFunction.userInformations.mailAddress,
                trailing: const Icon(
                  Icons.mail,
                  color: Color.fromARGB(255, 53, 181, 222),
                ),
                leading: const Icon(
                  Icons.edit,
                  color: Color.fromARGB(255, 53, 181, 222),
                ),
                isPassword: false,
              ),
              EditUserField(
                db_field: "",
                defaultTitle: "Password",
                fieldValue: "123355",
                trailing: const Icon(
                  Icons.lock,
                  color: Color.fromARGB(255, 53, 181, 222),
                ),
                leading: const Icon(
                  Icons.edit,
                  color: Color.fromARGB(255, 53, 181, 222),
                ),
                isPassword: true,
              )
            ],
          )),
        ));
  }
}

import 'package:chatty/pages/home/Home.dart';
import 'package:chatty/service/auth_service.dart';
import 'package:chatty/service/database_service.dart';
import 'package:chatty/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool chose = false;
  int profile = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Choose a profile",
          style: TextStyle(color: Color.fromARGB(255, 53, 181, 222)),
        ),
      ),
      body: Center(
          child: SizedBox(
              height: 300,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Customer",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: chose && profile == 0
                                    ? const Color.fromARGB(255, 53, 181, 222)
                                    : Colors.grey),
                          ),
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 10,
                                  color: chose && profile == 0
                                      ? const Color.fromARGB(255, 53, 181, 222)
                                      : Colors.transparent,
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(60))),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    chose =
                                        true; //chose == true ? false : true;
                                    profile = 0;
                                    var e = DatabaseService();
                                    e.updateValueInTable(
                                        FirebaseAuth.instance.currentUser!.uid,
                                        "profile",
                                        profile);
                                  });
                                },
                                child: const CircleAvatar(
                                    radius: 40,
                                    backgroundImage: AssetImage(
                                        "assets/images/people.png"))),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Driver",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: chose && profile == 1
                                    ? const Color.fromARGB(255, 53, 181, 222)
                                    : Colors.grey),
                          ),
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 10,
                                  color: chose && profile == 1
                                      ? const Color.fromARGB(255, 53, 181, 222)
                                      : Colors.transparent,
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(60))),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    chose =
                                        true; //chose == true ? false : true;
                                    profile = 1;
                                    var e = DatabaseService();
                                    e.updateValueInTable(
                                        FirebaseAuth.instance.currentUser!.uid,
                                        "profile",
                                        profile);
                                  });
                                },
                                child: const CircleAvatar(
                                    radius: 40,
                                    backgroundImage: AssetImage(
                                        "assets/images/driver.png"))),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text("Are you a driver or a simple user?"),
                  const SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(double.infinity, 45),
                          primary: Theme.of(context).primaryColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: (() {
                        if (!chose) return;
                        nextScreen(context, HomePage());
                      }),
                      child: const Text(
                        "Continue",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ))
                ],
              ))),
    );
  }
}

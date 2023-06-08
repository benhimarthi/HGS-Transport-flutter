import 'dart:io';

import 'package:chatty/helper/helper_function.dart';
import 'package:chatty/model/comment.item.model.dart';
import 'package:chatty/pages/home/CommentItem.dart';
import 'package:chatty/pages/home/EditUserProfile.dart';
import 'package:chatty/widgets/widgets.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../helper/galeryImage.dart';
import '../../service/database_service.dart';

class ProfileBody extends StatefulWidget {
  String imgUrl;
  ProfileBody({super.key, required this.imgUrl});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

//Color.fromARGB(255, 182, 206, 225)
class _ProfileBodyState extends State<ProfileBody> {
  List<CommentItemModel> comments = [];
  void getComments() async {
    await DatabaseService()
        .findCommentByAuthorUID(HelperFunction.userInformations.uid)
        .then((value) {
      for (var n in value.docs) {
        comments.add(CommentItemModel.fromJson(n));
      }
      print(comments[0].imageLink);
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getComments();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * .99,
        color: const Color.fromARGB(255, 182, 206, 225),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  //color: Color.fromARGB(255, 107, 207, 240),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  HelperFunction.userInformations.imageLink == "" ||
                          widget.imgUrl == ""
                      ? GestureDetector(
                          onTap: () {},
                          child: const CircleAvatar(
                            radius: 60,
                            /*backgroundImage:
                        AssetImage("assets/images/profile_image/naruto.jpg"),*/
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
                              widget.imgUrl,
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
                              color: Color.fromARGB(255, 53, 181, 222),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          HelperFunction.userInformations.name,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                              fontWeight: FontWeight.w100, color: Colors.grey),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          nextScreen(context, const EditUserProfile());
                        },
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          width: MediaQuery.of(context).size.width * .3,
                          height: 35,
                          decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 106, 106, 106),
                                    blurRadius: .5,
                                    offset: Offset(.08, .7))
                              ],
                              color: Color.fromARGB(255, 53, 181, 222),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: const Center(
                            child: Text(
                              "Edit profile",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  border: Border.all(
                    width: 1,
                    color: const Color.fromARGB(255, 53, 181, 222),
                  )),
              child: GestureDetector(
                child: const ListTile(
                  leading: Icon(
                    Icons.credit_card,
                    color: Color.fromARGB(255, 53, 181, 222),
                  ),
                  title: Text("Payment mode"),
                  trailing: Icon(
                    Icons.edit,
                    color: Color.fromARGB(255, 53, 181, 222),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
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
                          "My Opinions",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 21, 21, 21)),
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
                    height: MediaQuery.of(context).size.height * .53,
                    child: ListView(
                        children: List.generate(comments.length, (index) {
                      return CommentItem(commentItemModel: comments[index]);
                    })),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

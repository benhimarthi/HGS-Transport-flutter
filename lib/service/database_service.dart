import 'dart:io';

import 'package:chatty/model/comment.item.model.dart';
import 'package:chatty/model/trajectory.item.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  final CollectionReference commentsCollection =
      FirebaseFirestore.instance.collection("comments");

  final CollectionReference routeCollection =
      FirebaseFirestore.instance.collection("route");

  Future findUserByHisStatut({value = 1, nb = 2}) async {
    var users =
        userCollection.where("profile", isEqualTo: value).limit(nb).get();
    return users;
  }

  Future savingUserData(String fullName, String email, File imgLink) async {
    if (imgLink.path != "") uploadPic(imgLink);
    return await userCollection.doc(uid).set({
      "fullName": fullName,
      "email": email,
      "profile": 0,
      "note": 0,
      "notations": {"st_1": 0, "st_2": 0, "st_3": 0, "st_4": 0, "st_5": 0},
      "connectivityStatu": 0,
      "licensePlate": "",
      "carModel": "",
      "currentLoc": {"lat": 0.0, "long": 0.0},
      "profilePic": imgLink.path.split('/').last,
      "uid": uid,
    });
  }

  Future savingRouteData(TrajectItemModel routeInf) async {
    return await routeCollection.doc(uid).set({
      "origine": {
        "formatted_address": routeInf.origine.address,
        "name": routeInf.origine.name,
        "geometry": {
          "location": {
            "lat": routeInf.origine.latitude,
            "lng": routeInf.origine.longitude
          }
        }
      },
      "destination": routeInf.destination,
      "distance": routeInf.distance,
      "price": routeInf.price,
      "date": routeInf.date,
      "client_uid": routeInf.clientUID,
      "driver_uid": routeInf.driverUID,
    });
  }

  Future getRouteItemByDriverUID(String clientUID, {limit = 10}) async {
    return await routeCollection
        .where("driver_uid", isEqualTo: clientUID)
        .limit(limit)
        .get();
  }

  Future findCommentByTargetMailAddress(String email, {limit = 2}) async {
    return await commentsCollection
        .where("author_mail_address", isEqualTo: email)
        .limit(limit)
        .get();
  }

  Future findCommentByAuthorUID(String uid, {limit = 2}) async {
    return await commentsCollection
        .where("author_uid", isEqualTo: uid)
        .limit(limit)
        .get();
  }

  Future savingUserComment(CommentItemModel commentItem) async {
    return await commentsCollection.doc(uid).set({
      "target_mail_address": commentItem.mailAddress,
      "name": commentItem.name,
      "author_uid": commentItem.authorUID,
      "comment": commentItem.content,
      "date": commentItem.date,
    });
  }

  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  Future updateValueInTable(String uid, String target, dynamic newValue) async {
    return await userCollection.doc(uid).update({target: newValue});
  }

  Future uploadPic(File image) async {
    String fileName = image.path.split("/").last;
    var ref = FirebaseStorage.instance.ref().child(fileName);
    var uploadTask = ref.putFile(image);
    await uploadTask.whenComplete(() {
      const SnackBar(
        content: Text("Picture uploaded successfully"),
        backgroundColor: Colors.green,
      );
    });
  }
}

import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
    fillColor: Colors.amber,
    labelStyle: TextStyle(
        color: Color.fromARGB(255, 97, 97, 97), fontWeight: FontWeight.w500),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide:
            BorderSide(color: Color.fromARGB(255, 39, 149, 185), width: 2)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide:
            BorderSide(color: Color.fromARGB(255, 53, 181, 222), width: 2)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.red, width: 2)));

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

void showSnackbar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: const TextStyle(fontSize: 14),
    ),
    backgroundColor: color,
    duration: const Duration(seconds: 2),
    action: SnackBarAction(
      label: "OK",
      onPressed: (() {}),
      textColor: Colors.white,
    ),
  ));
}

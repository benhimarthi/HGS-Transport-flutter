import 'dart:convert';

import 'package:chatty/widgets/TextInput.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';
import 'Home.dart';

class PathEvaluator extends StatefulWidget {
  const PathEvaluator({super.key});

  @override
  State<PathEvaluator> createState() => _PathEvaluatorState();
}

class _PathEvaluatorState extends State<PathEvaluator> {
  final dynamic _history = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Estimate the price of a trip",
          style: TextStyle(color: Color.fromARGB(255, 53, 181, 222)),
        ),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 53, 181, 222),
          ),
          onPressed: () {
            nextScreen(context, const HomePage());
          },
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(5),
          child: Center(
              child: Container(
            width: MediaQuery.of(context).size.width * .95,
            decoration: const BoxDecoration(color: Colors.white, boxShadow: []),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                TextInput(
                    defaultValue: "",
                    isPassword: false,
                    placeholder: "Departure point",
                    prefixIcon: const Icon(
                      Icons.location_on,
                      color: Color.fromARGB(255, 53, 181, 222),
                    ),
                    sufixIcon: const Icon(Icons.abc),
                    onChange: null,
                    validator: null),
                const SizedBox(
                  height: 15,
                ),
                TextInput(
                    defaultValue: "",
                    isPassword: false,
                    placeholder: "Departure point",
                    prefixIcon: const Icon(
                      Icons.my_location_rounded,
                      color: Color.fromARGB(255, 53, 181, 222),
                    ),
                    sufixIcon: const Icon(Icons.abc),
                    onChange: null,
                    validator: null),
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
                Container(
                  width: MediaQuery.of(context).size.width * .8,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 239, 239, 239),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: TextFormField(
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                            hintText: "0.0 MAD",
                            border: InputBorder.none,
                            hintStyle: TextStyle(fontWeight: FontWeight.bold))),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .85,
                  height: 1,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 228, 228, 228)),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .95,
                  height: MediaQuery.of(context).size.height * .3,
                  decoration: const BoxDecoration(
                      //color: Color.fromARGB(255, 228, 228, 228)
                      ),
                  child: const Center(
                      child: Icon(
                    Icons.history,
                    color: Color.fromARGB(255, 216, 216, 216),
                    size: 150,
                  )),
                ),
              ],
            ),
          ))),
    );
  }
}

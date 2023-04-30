import 'package:flutter/material.dart';

import '../../widgets/TextInput.dart';

class ConfigureTrajectory extends StatefulWidget {
  const ConfigureTrajectory({super.key});

  @override
  State<ConfigureTrajectory> createState() => _ConfigureTrajectoryState();
}

class _ConfigureTrajectoryState extends State<ConfigureTrajectory>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(5),
          child: Center(
              child: Container(
            width: MediaQuery.of(context).size.width * .95,
            decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [],
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Center(
                  child: Text(
                    "Configure the Trajectory",
                    style: TextStyle(
                        color: Color.fromARGB(255, 80, 80, 80),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextInput(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(value: false, onChanged: (val) {}),
                    const Text("I don't know my destination")
                  ],
                ),
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
              ],
            ),
          ))),
    );
  }
}

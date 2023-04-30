import 'package:flutter/material.dart';

import 'Home.dart';

class CallDriver extends StatefulWidget {
  const CallDriver({super.key});

  @override
  State<CallDriver> createState() => _CallDriverState();
}

class _CallDriverState extends State<CallDriver> {
  bool showConductorDetails = false;
  bool showFilter = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 170,
            margin: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_back)),
                GestureDetector(
                  child: const Text(
                    "Configure trajectory",
                    style: TextStyle(color: Color.fromARGB(255, 100, 100, 100)),
                  ),
                )
              ],
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: const Color.fromARGB(255, 53, 181, 222),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          showFilter = showFilter == true ? false : true;
                        });
                      },
                      child: Row(
                        children: [
                          const Text(
                            "Filter",
                            style: TextStyle(
                                color: Color.fromARGB(255, 53, 181, 222)),
                          ),
                          !showFilter
                              ? const Icon(
                                  Icons.arrow_drop_down,
                                  color: Color.fromARGB(255, 53, 181, 222),
                                )
                              : const Icon(
                                  Icons.close,
                                  color: Color.fromARGB(255, 53, 181, 222),
                                )
                        ],
                      ),
                    ),
                  ),
                  const Text(
                    "Most close",
                    style: TextStyle(color: Color.fromARGB(255, 53, 181, 222)),
                  )
                ],
              ),
              Visibility(
                  visible: showFilter,
                  child: Container(
                      //color: Colors.green,
                      margin: const EdgeInsets.all(5),
                      width: double.infinity,
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Checkbox(value: true, onChanged: (vl) {}),
                              const Text("Most close")
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(value: false, onChanged: (vl) {}),
                              const Text("Best rate")
                            ],
                          )
                        ],
                      ))),
            ],
          ),
          Container(
            //color: const Color.fromARGB(255, 53, 181, 222),
            margin: const EdgeInsets.all(5),
            width: double.infinity,
            height: 240,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showConductorDetails =
                            showConductorDetails == true ? false : true;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * .9,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 225, 225, 225),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const CircleAvatar(
                                radius: 45,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Naruto.s@jpmanga.jp",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 53, 181, 222),
                                        fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "James potter",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: List.generate(5, (index) {
                                      return const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      );
                                    }),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Distance : 410 m",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Visibility(
                              visible: showConductorDetails,
                              child: Container(
                                child: Column(
                                  children: [
                                    const Text(
                                      "Car Informations",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 130, 130, 130)),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          //mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text.rich(TextSpan(
                                                text: "License plate : ",
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: "82400",
                                                    style: const TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 46, 46, 46),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14))),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Text.rich(TextSpan(
                                                text: "Car model : ",
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: "Hundai",
                                                    style: const TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 46, 46, 46),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14))),
                                          ],
                                        ),
                                        Icon(
                                          Icons.local_taxi,
                                          size: 60,
                                          color:
                                              Color.fromARGB(255, 53, 181, 222),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    MaterialButton(
                                      onPressed: () {},
                                      child: Container(
                                        height: 45,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .4,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          color:
                                              Color.fromARGB(255, 53, 181, 222),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Call the driver",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            //color: const Color.fromARGB(255, 53, 181, 222),
            margin: const EdgeInsets.all(5),
            width: double.infinity,
            //height: 50,
            child: MaterialButton(
              onPressed: () {
                setState(() {});
              },
              child: Container(
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
                      "Call drivers",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

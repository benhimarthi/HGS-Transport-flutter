import 'package:chatty/model/popup.btn.item.dart';
import 'package:chatty/model/service.history.item.dart';
import 'package:chatty/pages/home/DriverViews/PopupBtnManager.dart';
import 'package:chatty/pages/home/DriverViews/ServHistoryItem.dart';
import 'package:chatty/pages/home/DriverViews/ServiceGraphManager.dart';
import 'package:flutter/material.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 181,
          222), //const Color.fromARGB(255, 182, 206, 225), //Color.fromARGB(255, 53, 181, 222),
      appBar: AppBar(
        title: const Text(
          "Statistics",
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          //height: double.infinity,
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(5),
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 53, 181, 222),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(children: [
            Container(
              margin: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total amount",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  PopUpBtnManager(popupitems: [
                    PopupBtnItem(label: "January", value: 1, action: () {}),
                    PopupBtnItem(label: "February", value: 2, action: () {}),
                    PopupBtnItem(label: "February", value: 2, action: () {}),
                  ])
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              width: double.infinity,
              child: Text.rich(
                TextSpan(
                    text: "1,500",
                    children: <TextSpan>[
                      TextSpan(
                        text: "DHs",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 20),
                      ),
                    ],
                    style: const TextStyle(
                        color: Color.fromARGB(255, 92, 92, 92),
                        fontSize: 80,
                        fontWeight: FontWeight.bold)),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              width: double.infinity,
              child: Text.rich(
                TextSpan(
                    text: "From : ",
                    children: <TextSpan>[
                      TextSpan(
                        text: "10.03.2023",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              width: double.infinity,
              child: Text.rich(
                TextSpan(
                    text: "To : ",
                    children: <TextSpan>[
                      TextSpan(
                        text: "30.03.2023",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PopUpBtnManager(popupitems: [
                    PopupBtnItem(label: "This year", value: 1, action: () {}),
                    PopupBtnItem(label: "This mounth", value: 2, action: () {}),
                    PopupBtnItem(label: "February", value: 2, action: () {}),
                  ]),
                  Row(children: [
                    const Text(
                      "Gaphics",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        tooltip: "read more about graph",
                        onPressed: () {},
                        icon: const Icon(
                          Icons.help,
                          color: Colors.white,
                        ))
                  ]),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: GraphManager(),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Service history"),
                  GestureDetector(
                    child: const Text(
                      "See More...",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            ServHistoryItem(
                serviceHistoryItem: ServiceHistoryItem(
                    locationName: "roudani", date: "10.04.2023", price: 57)),
            ServHistoryItem(
                serviceHistoryItem: ServiceHistoryItem(
                    locationName: "Hay salam", date: "11.04.2023", price: 76))
          ]),
        ),
      ),
    );
  }
}

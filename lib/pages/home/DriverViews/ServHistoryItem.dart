import 'package:chatty/model/service.history.item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ServHistoryItem extends StatefulWidget {
  ServiceHistoryItem serviceHistoryItem;
  ServHistoryItem({super.key, required this.serviceHistoryItem});

  @override
  State<ServHistoryItem> createState() =>
      _ServHistoryItemState(serviceHistoryItem);
}

class _ServHistoryItemState extends State<ServHistoryItem> {
  ServiceHistoryItem serviceHistoryItem;
  _ServHistoryItemState(this.serviceHistoryItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 80,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Stack(children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            serviceHistoryItem.locationName,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Text(
            serviceHistoryItem.date,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Text(
            "${serviceHistoryItem.price} DH",
            style: const TextStyle(
                color: Color.fromARGB(255, 53, 181, 222),
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        )
      ]),
    );
  }
}

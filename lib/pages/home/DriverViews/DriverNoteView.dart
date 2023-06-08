import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../model/note.indicator.conf.dart';
import 'CustomProgressBar.dart';
import 'NoteIndicator.dart';

class DriverNoteView extends StatefulWidget {
  const DriverNoteView({super.key});

  @override
  State<DriverNoteView> createState() => _DriverNoteViewState();
}

class _DriverNoteViewState extends State<DriverNoteView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: const Color.fromARGB(102, 158, 158, 158)),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            //color: Colors.red,
            width: 190,
            child: NoteIndicator(
              noteIndicatorConf: NoteIndicatorConf(
                  currentValue: 0.3,
                  maxValue: 1,
                  radius: .5,
                  indSize: 10,
                  msgSizeBox: 85),
            ),
          ),
          Container(
            //color: Color.fromARGB(255, 13, 34, 103),
            //width: 170,
            margin: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                  children: List.generate(5, (index) {
                double note = Random().nextDouble() * 5 / 5;
                return Row(
                  children: [
                    Row(
                      children: [
                        Text((index + 1).toString()),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.all(3),
                      width: 100,
                      height: 15,
                      child: CustomPaint(
                        painter: CustomProgressBar(
                            currentValue: 100 * note, color: Colors.green),
                      ),
                    )
                  ],
                );
              })),
            ),
          )
        ],
      ),
    );
  }
}

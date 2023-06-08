import 'package:chatty/helper/helper_function.dart';
import 'package:chatty/pages/home/DriverViews/DriverNoteView.dart';
import 'package:chatty/pages/home/DriverViews/Timers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../model/note.indicator.conf.dart';
import 'NoteIndicator.dart';

class CallTimer extends StatefulWidget {
  const CallTimer({super.key});

  @override
  State<CallTimer> createState() => _CallTimerState();
}

class _CallTimerState extends State<CallTimer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(minutes: 1));
    final Animation<double> curve =
        CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //print(_controller.value);
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
            child: SizedBox(
          //color: Colors.red,
          width: 190,
          child: Timers(
            noteIndicatorConf: NoteIndicatorConf(
                currentValue: .5,
                maxValue: 1,
                radius: .5,
                indSize: 10,
                msgSizeBox: 80),
          ),
        )),
      ),
      /*,*/
    );
  }
}

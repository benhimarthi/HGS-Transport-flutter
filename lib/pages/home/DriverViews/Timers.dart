import 'package:chatty/model/note.indicator.conf.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Timers extends StatefulWidget {
  NoteIndicatorConf noteIndicatorConf;
  Timers({super.key, required this.noteIndicatorConf});

  @override
  State<Timers> createState() => _TimersState(noteIndicatorConf);
}

class _TimersState extends State<Timers> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  NoteIndicatorConf noteIndicatorConf;
  _TimersState(this.noteIndicatorConf);

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
    return Container(
      child: SfRadialGauge(axes: <RadialAxis>[
        RadialAxis(
            minimum: 0,
            maximum: noteIndicatorConf.maxValue,
            startAngle: 270,
            endAngle: 270,
            showLabels: false,
            showTicks: false,
            radiusFactor: noteIndicatorConf.radius,
            axisLineStyle: AxisLineStyle(
                cornerStyle: CornerStyle.bothFlat,
                color: Colors.black12,
                thickness: noteIndicatorConf.indSize),
            pointers: <GaugePointer>[
              RangePointer(
                  value: _controller.value,
                  cornerStyle: CornerStyle.bothFlat,
                  width: noteIndicatorConf.indSize,
                  sizeUnit: GaugeSizeUnit.logicalPixel,
                  color: Colors.orangeAccent,
                  gradient: const SweepGradient(colors: <Color>[
                    Color.fromARGB(255, 74, 242, 60),
                    Color.fromARGB(255, 74, 242, 60)
                  ], stops: <double>[
                    0.25,
                    0.75
                  ])),
              MarkerPointer(
                  value: _controller.value,
                  enableDragging: true,
                  onValueChanged: (vl) {},
                  markerHeight: 40,
                  markerWidth: 40,
                  markerType: MarkerType.image,
                  color: Color(0XFFFFAB40),
                  borderWidth: 2,
                  borderColor: Colors.white54)
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  angle: 90,
                  axisValue: 5,
                  positionFactor: 0.1,
                  widget: Container(
                    width: noteIndicatorConf.msgSizeBox,
                    height: noteIndicatorConf.msgSizeBox,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.all(
                            Radius.circular(noteIndicatorConf.msgSizeBox / 2)),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, .9),
                              blurRadius: 1.4,
                              color: Color.fromARGB(255, 134, 134, 134))
                        ]),
                    child: Center(
                      child: Text(_controller.value.toStringAsFixed(1),
                          style: const TextStyle(
                              fontSize: 25, //45
                              //fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 53, 181, 222))),
                    ),
                  ))
            ])
      ]),
    );
  }
}

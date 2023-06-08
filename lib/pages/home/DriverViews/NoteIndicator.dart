import 'package:chatty/model/note.indicator.conf.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class NoteIndicator extends StatefulWidget {
  NoteIndicatorConf noteIndicatorConf;
  NoteIndicator({super.key, required this.noteIndicatorConf});

  @override
  State<NoteIndicator> createState() => _NoteIndicatorState(noteIndicatorConf);
}

class _NoteIndicatorState extends State<NoteIndicator> {
  NoteIndicatorConf noteIndicatorConf;
  _NoteIndicatorState(this.noteIndicatorConf);

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
                  value: noteIndicatorConf.currentValue,
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
              /*MarkerPointer(
                  value: _controller.value,
                  enableDragging: true,
                  onValueChanged: (vl) {},
                  markerHeight: 40,
                  markerWidth: 40,
                  markerType: MarkerType.image,
                  color: Color(0XFFFFAB40),
                  borderWidth: 2,
                  borderColor: Colors.white54)*/
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
                      child: Text(
                          noteIndicatorConf.currentValue.toStringAsFixed(1),
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

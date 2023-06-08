import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../model/price.point.dart';

class GraphManager extends StatefulWidget {
  const GraphManager({super.key});

  @override
  State<GraphManager> createState() => _GraphManagerState();
}

const _dashArray = [4, 2];

class _GraphManagerState extends State<GraphManager> {
  final bool isPositiveChange = true;
  List<PricePoint> points = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    points = List.generate(
        7,
        (index) =>
            PricePoint(x: index.toDouble(), y: Random().nextDouble() * 100));
  }

  double nb = 0;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2,
        child: LineChart(
          LineChartData(
            backgroundColor: Colors.white,
            minY: points.map((point) => point.y).reduce(min),
            maxY: points.map((point) => point.y).reduce(max),
            lineBarsData: [
              LineChartBarData(
                spots: points.map((point) => FlSpot(point.x, point.y)).toList(),
                isCurved: false,
                color: isPositiveChange
                    ? const Color.fromARGB(255, 53, 181, 222)
                    : Colors.red,
                dotData: FlDotData(
                  show: false,
                ),
              ),
            ],
            titlesData: FlTitlesData(
                leftTitles: AxisTitles(axisNameWidget: const Text("amount")),
                rightTitles: AxisTitles(axisNameSize: 0),
                topTitles: AxisTitles(),
                bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    if (value % 2 == 0 || value % 2 == 1) {
                      //print(PricePoint.xDatas(Filter.mounth)[nb.toInt()]);
                      var xVals = PricePoint.xDatas(Filter.year);
                      if (value.toInt() < xVals.length) {
                        return Text(xVals[value.toInt()]);
                      }
                    }
                    return const Text("");
                  },
                ))),
            borderData: FlBorderData(
                border: Border.all(
                    color: Colors
                        .transparent) //const Border(bottom: BorderSide(), left: BorderSide())
                ),
            gridData: FlGridData(
                show: true, drawHorizontalLine: true, drawVerticalLine: false),
          ),

          swapAnimationDuration: const Duration(milliseconds: 150), // Optional
          swapAnimationCurve: Curves.linear,
          // Optional
        ));
  }
}

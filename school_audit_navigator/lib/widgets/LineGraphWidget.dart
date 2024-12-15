import 'dart:ffi';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:school_audit_navigator/objects/line_graph_data.dart';

class LineGraphWidget extends StatelessWidget {
  final List<LineGraphData> data;
  
  const LineGraphWidget(this.data, {Key?key}) : super(key: key);
  double getMax(List<LineGraphData> data){
    int i =0;
    double max = 0;
    while (i < data.length){
      if (data.elementAt(i).y > max){
        max = data.elementAt(i).y;
      }
      i++;
    }
    return max;
  }
  double getMin(List<LineGraphData> data){
    int i =0;
    double min = double.maxFinite;
    while (i < data.length){
      if (data.elementAt(i).y < min){
        min = data.elementAt(i).y;
      }
      i++;
    }
    return min;
  }
  @override
  Widget build(BuildContext context) {
    return LineChart(LineChartData(
      lineBarsData: [
        LineChartBarData(
          spots: data.map((point) => FlSpot(point.x, point.y)).toList(),
          isCurved: false,
          dotData: FlDotData(show: true),
        ),
      ],
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(getTooltipItems: (List<LineBarSpot> touchedSpots) =>
    touchedSpots.map((LineBarSpot touchedSpot) {
      final textStyle = TextStyle(
        color: touchedSpot.bar.gradient?.colors.first ??
            touchedSpot.bar.color ??
            Colors.blueGrey,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      );
      String Tooltip = "\$" + touchedSpot.y.round().toString();
      return LineTooltipItem(Tooltip, textStyle);
    }).toList()
          
        )
          
        
      ),
      titlesData: const FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 200,
            getTitlesWidget: getTitles,
          )
        ),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)
        ),
        ),
        minY: 500000,
        maxY: getMax(data) * 1.2
      )
      );
  }
}

Widget getTitles(double value, TitleMeta meta){
  Widget text;
  switch (value.toInt()){
    case 2016:
    text = const Text('2016');
    break;
    case 2017:
    text = const Text('2017');
    break;
    case 2018:
    text = const Text('2018');
    break;
    case 2019:
    text = const Text('2019');
    break;
    case 2020:
    text = const Text('2020');
    break;
    case 2021:
    text = const Text('2021');
    break;
    case 2022:
    text = const Text('2022');
    break;
    case 2023:
    text = const Text('2023');
    break;
    case 2024:
    text = const Text('2024');
    break;
    case 2025:
    text = const Text('2025');
    break;
    default:
    text = const Text('default');
  }
  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
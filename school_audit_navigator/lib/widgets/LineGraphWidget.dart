import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:school_audit_navigator/objects/lineGraphData.dart';

class LineGraphWidget extends StatelessWidget {
  final List<LineGraphData> data;
  
  const LineGraphWidget(this.data, {Key?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineChart(LineChartData(lineBarsData: [LineChartBarData(
      spots: data.map((point) => FlSpot(point.x, point.y)).toList(),
      isCurved: false,
      dotData: FlDotData(show: true),
    ),],
    
    )
    );
  }
}
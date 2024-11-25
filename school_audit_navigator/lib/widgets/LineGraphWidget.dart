import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:school_audit_navigator/objects/lineGraphData.dart';

class LineGraphWidget extends StatelessWidget {
  final List<LineGraphData> data;
  
  const LineGraphWidget(this.data, {Key?key}) : super(key: key);

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
      titlesData: const FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
          )
        )

        ),
        minY: 0,
        maxY: 1000000
      )
      );
  }
}

Widget getTitles(double value, TitleMeta meta){
  Widget text;
  switch (value.toInt()){
    case 0:
    text = const Text('2016');
    break;
    case 1:
    text = const Text('2017');
    break;
    case 2:
    text = const Text('2018');
    break;
    case 3:
    text = const Text('2019');
    break;
    case 4:
    text = const Text('2020');
    break;
    case 5:
    text = const Text('2021');
    break;
    case 6:
    text = const Text('2022');
    break;
    case 7:
    text = const Text('2023');
    break;
    case 8:
    text = const Text('2024');
    break;
    case 9:
    text = const Text('2025');
    break;
    default:
    text = const Text('default');
  }
  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
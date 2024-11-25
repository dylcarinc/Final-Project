import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';

class LineGraphData{
  final double x;
  final double y;
  LineGraphData({required this.x, required this.y});
}

List<LineGraphData> get graphData {
  //turn data into list of total federal expenditure in order of years
  final data = <double>[100000, 200000, 150000, 400000, 500000, 450000, 600000, 400000, 650000];
  return data.mapIndexed(((index, element) => LineGraphData(x: index.toDouble(), y: element))).toList();
}

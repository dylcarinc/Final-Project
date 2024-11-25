import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';

class LineGraphData{
  final double x;
  final double y;
  LineGraphData({required this.x, required this.y});
}

List<LineGraphData> get graphData {
  final data = <double>[100000, 200000, 150000, 400000, 500000];
  return data.mapIndexed(((index, element) => LineGraphData(x: index.toDouble(), y: element))).toList();
}

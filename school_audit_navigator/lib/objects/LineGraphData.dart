import 'package:collection/collection.dart';

class LineGraphData{
  final double x;
  final double y;
  LineGraphData({required this.x, required this.y});
}

List<LineGraphData> get graphData {
  final data = <double>[10000, 20000, 15000, 40000, 50000];
  return data.mapIndexed(((index, element) => LineGraphData(x: index.toDouble(), y: element))).toList();
}
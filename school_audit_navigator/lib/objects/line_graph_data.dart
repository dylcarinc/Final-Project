
import 'package:school_audit_navigator/api.dart';

class LineGraphData{
  final double x;
  final double y;
  LineGraphData({required this.x, required this.y});
}

Future<List<LineGraphData>>  graphData(String ein) async {
  Map<String, double> dataList = await getOtherYears(ein);
  final data = <LineGraphData>[];
  dataList.forEach((key, value) {
    String k = key;
    data.add(LineGraphData(x: double.parse(k), y: value));
  });
return data;
}
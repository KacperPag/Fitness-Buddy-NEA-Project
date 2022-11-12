import 'package:fitnessbuddyandroid/utils/theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fitnessbuddyandroid/utils/user_data.dart';

Widget lineChart(double height, double width) => Container(
  height: height,
  width: width,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: widgetBackgroundColour
  ),
  child: LineChart(data),
);

LineChartData get data => LineChartData(
  lineTouchData: _lineTouchData,
  gridData: _gridData,
  titlesData: _titlesData,
  borderData: _borderData,
  lineBarsData: [ _lineChartBarData ],
  minX: 0,
  maxX: 10,
  minY: minAxisY.toDouble(),
  maxY: maxAxisY.toDouble()
);


LineTouchData get _lineTouchData => LineTouchData(
  handleBuiltInTouches: true,
  touchTooltipData: LineTouchTooltipData(
    tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
  ),
);

FlTitlesData get _titlesData => FlTitlesData(
  bottomTitles: AxisTitles(
    sideTitles: bottomTitles,
  ),
  rightTitles: AxisTitles(
    sideTitles: SideTitles(showTitles: false),
  ),
  topTitles: AxisTitles(
    sideTitles: SideTitles(showTitles: false),
  ),
  leftTitles: AxisTitles(
    sideTitles: leftTitles(),
  ),
);


SideTitles leftTitles() => SideTitles(
  getTitlesWidget: axisYLabels,
  showTitles: true,
  interval: 2,
  reservedSize: 40,
);

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff72719b),
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  Widget text;
  switch (value.toInt()) {
    case 2:
      text = const Text('SEPT', style: style);
      break;
    case 7:
      text = const Text('OCT', style: style);
      break;
    case 12:
      text = const Text('DEC', style: style);
      break;
    default:
      text = const Text('');
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 10,
    child: text,
  );
}

SideTitles get bottomTitles => SideTitles(
  showTitles: true,
  reservedSize: 32,
  interval: 1,
  getTitlesWidget: bottomTitleWidgets,
);

FlGridData get _gridData => FlGridData(show: false);

FlBorderData get _borderData => FlBorderData(
  show: true,
  border: const Border(
    bottom: BorderSide(color: Color(0xff4e4965), width: 4),
    left: BorderSide(color: Colors.transparent),
    right: BorderSide(color: Colors.transparent),
    top: BorderSide(color: Colors.transparent),
  ),
);

LineChartBarData get _lineChartBarData => LineChartBarData(
  isCurved: false,
  color: const Color(0xff4af699),
  barWidth: 8,
  isStrokeCapRound: true,
  dotData: FlDotData(show: false),
  belowBarData: BarAreaData(show: false),
  spots: spots
);

double currentYLabel = -1;
Widget axisYLabels(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff75729e),
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  if (currentYLabel < meta.max && currentYLabel != -1) {
    currentYLabel += 2;
  }
  else {
    currentYLabel = meta.min;
  }
  return Text(currentYLabel.toString(), style: style, textAlign: TextAlign.center);
}


int baseNumber = 0;
int minAxisY = 0;
int maxAxisY = 0;
List<FlSpot> spots = [];

void getDataFromList() {
  baseNumber = int.parse(userWeightData[0].weight);
  minAxisY = baseNumber - 10;
  maxAxisY = baseNumber + 10;
  for (int i = 0; i < userWeightData.length; i++) {
    spots.add(FlSpot(i.toDouble(), double.parse(userWeightData[i].weight)));
  }
}
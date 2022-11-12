import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:fitnessbuddyandroid/record/laughing_data.dart';
import 'package:fl_chart/fl_chart.dart';

int activeWeek = 0;
const leftPadding = 60.0;
const rightPadding = 60.0;
double chartHeight = 240;
late List<ChartDataPoint> chartData;

Widget displayGraph(BuildContext context, double graphHeight) => Stack(
  children: [
    ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          height: graphHeight + 80,
          color: Color.fromRGBO(81, 18, 127, 1),
          child: Stack(
            children: [
              ChartLaughLabels(
                chartHeight: graphHeight,
                topPadding: 40,
                leftPadding: leftPadding,
                rightPadding: rightPadding,
                weekData: weeksData[0],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ChartDayLabels(
                  leftPadding: leftPadding,
                  rightPadding: rightPadding,
                ),
              ),
              Positioned(
                top: 40,
                child: CustomPaint(
                  size: Size(
                    MediaQuery.of(context).size.width, chartHeight
                  ),
                  painter: PathPainter(
                    path: drawPath(false, context),
                    fillPath: drawPath(true, context),
                  )
                ),
              )
            ],
          ),
        ),
      ],
    ),
  ],
);




List<ChartDataPoint> normalizeData(WeekData weekData) {
  final maxDay = weekData.days.reduce((DayData dayA, DayData dayB) {
    return dayA.laughs > dayB.laughs ? dayA : dayB;
  });
  final normalizedList = <ChartDataPoint>[];
  for (var element in weekData.days) {
    normalizedList.add(ChartDataPoint(
        value: maxDay.laughs == 0 ? 0 : element.laughs / maxDay.laughs));
  }
  return normalizedList;
}
Path drawPath(bool closePath, BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final height = chartHeight;
  final path = Path();
  final segmentWidth = (width - leftPadding - rightPadding) / ((chartData.length - 1) * 3);

  path.moveTo(0, height - chartData[0].value * height);
  path.lineTo(leftPadding, height - chartData[0].value * height);

  for (var i = 1; i < chartData.length; i++) {
    path.cubicTo(
      (3 * (i - 1) + 1) * segmentWidth + leftPadding,
      height - chartData[i - 1].value * height,
      (3 * (i - 1) + 2) * segmentWidth + leftPadding,
      height - chartData[i].value * height,
      (3 * (i - 1) + 3) * segmentWidth + leftPadding,
      height - chartData[i].value * height);
  }

  path.lineTo(width, height - chartData[chartData.length - 1].value * height);

  if (closePath) {
    path.lineTo(width, height);
    path.lineTo(0, height);
  }
  return path;
}


class PathPainter extends CustomPainter {
  Path path;
  Path fillPath;
  PathPainter({required this.path, required this.fillPath});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white..style = PaintingStyle.stroke..strokeWidth = 4.0;
    canvas.drawPath(path, paint);
    paint.style = PaintingStyle.fill;
    paint.shader = ui.Gradient.linear(
      Offset.zero,
      Offset(0.0, size.height),
      [ Colors.yellow.withOpacity(0.2), Colors.yellow.withOpacity(0.85) ],
    );
    canvas.drawPath(fillPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
class ChartDataPoint {
  double value;
  ChartDataPoint({required this.value});
}











class ChartDayLabels extends StatelessWidget {
  const ChartDayLabels( {Key? key, required this.leftPadding, required this.rightPadding}) : super(key: key);

  final double leftPadding;
  final double rightPadding;

  Offset labelOffset(int length, double i) {
    final segment = 1 / (length - 1);
    final offsetValue = (i - ((length - 1) / 2)) * segment;
    return Offset(offsetValue, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: const [0.0, 1.0],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.white, Colors.white.withOpacity(0.85)],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'].asMap().entries.map(
            (entry) => FractionalTranslation(
              translation: labelOffset(7, entry.key.toDouble()),
              child: SizedBox(
                width: 36,
                child: Text(
                  entry.value,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFA9A9A9),
                  ),
                ),
              ),
            ),
          ).toList(),
        ),
      ),
    );
  }
}

class ChartLaughLabels extends StatelessWidget {
  const ChartLaughLabels({
    Key? key,
    required this.chartHeight,
    required this.topPadding,
    required this.leftPadding,
    required this.rightPadding,
    required this.weekData,
  }) : super(key: key);

  final double chartHeight;
  final double topPadding;
  final double leftPadding;
  final double rightPadding;
  final WeekData weekData;

  @override
  Widget build(BuildContext context) {
    const labelCount = 10;
    final maxDay = weekData.days.reduce((DayData a, DayData b) {
      return a.laughs > b.laughs ? a : b;
    });
    final rowHeight = (chartHeight) / labelCount;

    final labels = <double>[];
    for (var i = 0; i < labelCount; i++) {
      labels.add(maxDay.laughs.toDouble() - (i * maxDay.laughs.toDouble() / (labelCount - 1)));
    }

    Offset labelOffset(int length, double i) {
      final segment = 1 / (length - 1);
      final offsetValue = (i - ((length - 1) / 2)) * segment;
      return Offset(0, offsetValue);
    }

    return Container(
      height: chartHeight + topPadding,
      padding: EdgeInsets.only(top: topPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: labels.asMap().entries.map((entry) => FractionalTranslation(
          translation: labelOffset(labelCount, entry.key.toDouble()),
          child: Container(
            height: rowHeight,
            alignment: Alignment.center,
            child: Row(
              children: [
                SizedBox(
                  width: leftPadding,
                  child: Text(
                    entry.value.toStringAsFixed(1),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 2,
                    color: Colors.black.withOpacity(0.15),
                  ),
                ),
                SizedBox(width: rightPadding),
              ],
            ),
          ),
        ),
      ).toList(),
      ),
    );
  }
}














class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({Key? key}) : super(key: key);

  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
              color: Color(0xff232d37)),
          child: Padding(
            padding: const EdgeInsets.only(
                right: 18.0, left: 12.0, top: 24, bottom: 12),
            child: LineChart(
              showAvg ? avgData() : mainData(),
            ),
          ),
        ),
        SizedBox(
          width: 60,
          height: 34,
          child: TextButton(
            onPressed: () {
              setState(() {
                showAvg = !showAvg;
              });
            },
            child: Text(
              'avg',
              style: TextStyle(
                  fontSize: 12,
                  color:
                  showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('06/28', style: style);
        break;
      case 2:
        text = const Text('JUN', style: style);
        break;
      case 4:
        text = const Text('SEP', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: false,
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }
}
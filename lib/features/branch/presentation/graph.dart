import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shop_ui/core/global_widgets/date_time.dart';
import 'package:shop_ui/core/utils/colors.dart';

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({super.key});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    AppColors.contentColorCyan,
    AppColors.contentColorBlue,
  ];

  List<FlSpot> mainChartData = const [
    FlSpot(0, 2),
    FlSpot(2, 3),
    FlSpot(4, 5),
    FlSpot(6, 3),
    FlSpot(8, 4),
    FlSpot(10, 8),
    FlSpot(12, 6),
    FlSpot(14, 4),
    FlSpot(16, 2),
    FlSpot(18, 7),
    FlSpot(20, 5),
    FlSpot(22, 6),
  ];

  List<FlSpot> dailyChartData = const [
    FlSpot(0, 4),
    FlSpot(2, 2),
    FlSpot(4, 7),
    FlSpot(6, 7),
    FlSpot(8, 4),
    FlSpot(10, 5),
    FlSpot(12, 6),
  ];

  List<FlSpot> weeklyChartData = const [
    FlSpot(0, 4),
    FlSpot(2, 2),
    FlSpot(4, 7),
    FlSpot(6, 7),
  ];

  bool showDaily = false;
  bool showWeekly = false;
  String toStringMonth = DateFormat('MMMM').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.85,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 20,
              left: 8,
              top: 30,
              // bottom: 12,
            ),
            child: LineChart(
              showDaily
                  ? dailyData()
                  : showWeekly
                      ? weeklyData()
                      : mainData(),
            ),
          ),
        ),
        SizedBox(
          width: 580,
          height: 34,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    showDaily = !showDaily;
                    showWeekly = false;
                  });
                },
                child: const Text(
                  'Daily',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    showWeekly = !showWeekly;
                    showDaily = false;
                  });
                },
                child: const Text(
                  'Weekly',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    showDaily = false;
                    showWeekly = false;
                  });
                },
                child: const Text(
                  'Monthly',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                ),
              ),
              Builder(builder: (context) {
                if (!showDaily) {
                  return const Text('');
                }
                return Padding(
                  padding: const EdgeInsets.only(left: 270),
                  child: Text(
                    toStringMonth,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta? meta) {
    const style = TextStyle(
      fontSize: 10,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('JAN', style: style);
        break;
      case 2:
        text = const Text('FEB', style: style);
        break;
      case 4:
        text = const Text('MAR', style: style);
        break;
      case 6:
        text = const Text('APR', style: style);
        break;
      case 8:
        text = const Text('MAY', style: style);
        break;
      case 10:
        text = const Text('JUN', style: style);
        break;
      case 12:
        text = const Text('JUL', style: style);
        break;
      case 14:
        text = const Text('AUG', style: style);
        break;
      case 16:
        text = const Text('SEP', style: style);
        break;
      case 18:
        text = const Text('OCT', style: style);
        break;
      case 20:
        text = const Text('NOV', style: style);
        break;
      case 22:
        text = const Text('DEC', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta!.axisSide,
      child: text,
    );
  }

  Widget bottomDailyTitleWidgets(double value, TitleMeta? meta) {
    const style = TextStyle(
      fontSize: 10,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text(GlobalDateTime.weekDays(DateTime.sunday - 7), style: style);
        break;
      case 2:
        text = Text(GlobalDateTime.weekDays(DateTime.monday), style: style);
        break;
      case 4:
        text = Text(GlobalDateTime.weekDays(DateTime.tuesday), style: style);
        break;
      case 6:
        text = Text(GlobalDateTime.weekDays(DateTime.wednesday), style: style);
        break;
      case 8:
        text = Text(GlobalDateTime.weekDays(DateTime.thursday), style: style);
        break;
      case 10:
        text = Text(GlobalDateTime.weekDays(DateTime.friday), style: style);
        break;
      case 12:
        text = Text(GlobalDateTime.weekDays(DateTime.saturday), style: style);
        break;
      default:
        text = const Text('', style: style);
    }

    return SideTitleWidget(
      axisSide: meta!.axisSide,
      child: text,
    );
  }

  Widget bottomWeeklyTitleWidgets(double value, TitleMeta? meta) {
    DateTime day = DateTime.now();
    const style = TextStyle(
      fontSize: 10,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Column(
          children: [
            Text('Week ${GlobalDateTime.weeksInAYear(0)}', style: style),
            Text(
              GlobalDateTime.daysPerWeek(
                day.weekday + 21,
                day.weekday + 22,
              ),
              style: style,
            ),
          ],
        );
        break;
      case 2:
        text = Column(
          children: [
            Text('Week ${GlobalDateTime.weeksInAYear(1)}', style: style),
            Text(
              GlobalDateTime.daysPerWeek(
                day.weekday + 14,
                day.weekday + 15,
              ),
              style: style,
            ),
          ],
        );
        break;
      case 4:
        text = Column(
          children: [
            Text('Week ${GlobalDateTime.weeksInAYear(2)}', style: style),
            Text(
              GlobalDateTime.daysPerWeek(
                day.weekday + 7,
                day.weekday + 8,
              ),
              style: style,
            ),
          ],
        );
        break;
      case 6:
        text = Column(
          children: [
            Text('Week ${GlobalDateTime.weeksInAYear(3)}', style: style),
            Text(
              GlobalDateTime.daysPerWeek(
                day.weekday,
                day.weekday + 1,
              ),
              style: style,
            ),
          ],
        );
        break;
      default:
        text = const Text('', style: style);
    }

    return SideTitleWidget(
      axisSide: meta!.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: Color.fromARGB(146, 0, 0, 0),
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '50k';
        break;
      case 3:
        text = '150k';
        break;
      case 5:
        text = '250k';
        break;
      case 7:
        text = '350k';
        break;
      case 9:
        text = '450k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          // tooltipBgColor: Colors.white,
          getTooltipItems: (value) {
            return value
                .map((e) => LineTooltipItem(
                      'Revenue: ${e.y}\n Transactions: ${e.x}',
                      GoogleFonts.ubuntu(
                        color: e.y > 4
                            ? Colors.greenAccent.shade400
                            : e.y == 4
                                ? Colors.yellowAccent
                                : Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
                .toList();
          },
        ),
      ),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: AppColors.borderColor,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: AppColors.borderColor,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
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
        show: false,
        // border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      // numbers of how many vertical lines in a graph
      maxX: 22,
      minY: 0,
      // numbers of how many horizontal lines in a graph
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: mainChartData,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 1,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData dailyData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          // tooltipBgColor: Colors.white,
          getTooltipItems: (value) {
            return value
                .map((e) => LineTooltipItem(
                      'Revenue: ${e.y}\n Transactions: ${e.x}',
                      GoogleFonts.ubuntu(
                        color: e.y > 4
                            ? Colors.greenAccent.shade400
                            : e.y == 4
                                ? Colors.yellowAccent
                                : Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
                .toList();
          },
        ),
      ),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: AppColors.borderColor,
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: AppColors.borderColor,
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
            getTitlesWidget: bottomDailyTitleWidgets,
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
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: dailyChartData,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 1,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData weeklyData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          // tooltipBgColor: Colors.white,
          getTooltipItems: (value) {
            return value
                .map((e) => LineTooltipItem(
                      'Revenue: ${e.y}\n Transactions: ${e.x}',
                      GoogleFonts.ubuntu(
                        color: e.y > 4
                            ? Colors.greenAccent.shade400
                            : e.y == 4
                                ? Colors.yellowAccent
                                : Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
                .toList();
          },
        ),
      ),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: AppColors.borderColor,
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: AppColors.borderColor,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 42,
            getTitlesWidget: bottomWeeklyTitleWidgets,
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
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: weeklyChartData,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 1,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

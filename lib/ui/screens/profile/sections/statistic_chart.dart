import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/core/base/base_widget_mixin.dart';

class StatisticChart extends StatelessWidget with BaseWidgetMixin {
  StatisticChart({Key? key}) : super(key: key);

  final List<Color> gradientColors = [
    AppColors.lightGreen,
    AppColors.lightYellow,
  ];

  @override
  Widget body(BuildContext context) {
    return LineChart(mainData());
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
        fontWeight: FontWeight.w400, fontSize: 12, color: AppColors.grey800);
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('T1', style: style);
        break;
      case 1:
        text = const Text('T2', style: style);
        break;
      case 2:
        text = const Text('T3', style: style);
        break;
      case 3:
        text = const Text('T4', style: style);
        break;
      case 4:
        text = const Text('T5', style: style);
        break;
      case 5:
        text = const Text('T6', style: style);
        break;
      case 6:
        text = const Text('T7', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: _buildGridData(),
      titlesData: _buildTitlesData(),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(1.6, 2),
            FlSpot(3.1, 3.2),
            FlSpot(3.9, 4.5),
            FlSpot(4.6, 5.3),
            FlSpot(5.9, 3),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: _buildDotData(),
          belowBarData: _buildBarAreaData(),
        ),
      ],
    );
  }

  BarAreaData _buildBarAreaData() {
    return BarAreaData(show: false);
  }

  FlDotData _buildDotData() {
    return FlDotData(show: false);
  }

  FlGridData _buildGridData() {
    return FlGridData(show: false);
  }

  FlTitlesData _buildTitlesData() {
    return FlTitlesData(
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
          reservedSize: 32,
          interval: 1,
          getTitlesWidget: bottomTitleWidgets,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
    );
  }
}

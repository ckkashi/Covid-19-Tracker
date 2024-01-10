import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:tracker_covid_19/services/utilities/app_color.dart';

class StatsChart extends StatelessWidget {
  StatsChart({
    super.key,
    required this.pieData,
    this.pieColor = const [
      AppColor.primaryBlue,
      Colors.green,
      AppColor.primaryOrange,
      Colors.redAccent,
      Colors.yellowAccent
    ],
  });
  List<Color> pieColor;

  final Map<String, double> pieData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 11),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: AppColor.secondaryWhite,
          boxShadow: const [
            BoxShadow(
              spreadRadius: 0,
              blurRadius: 2,
              color: AppColor.secondaryGrey,
            )
          ],
        ),
        child: PieChart(
          colorList: pieColor,
          dataMap: pieData,
          chartType: ChartType.ring,
          chartValuesOptions: const ChartValuesOptions(
              showChartValuesInPercentage: true,
              showChartValuesOutside: true,
              showChartValues: false),
          chartLegendSpacing: 40,
          chartRadius: 80.0,
          ringStrokeWidth: 15,
          legendOptions:
              const LegendOptions(legendPosition: LegendPosition.left),
        ),
      ),
    );
  }
}

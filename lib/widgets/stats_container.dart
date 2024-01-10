// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:tracker_covid_19/models/CountryStatsModel.dart';
import 'package:tracker_covid_19/services/utilities/app_color.dart';
import 'package:tracker_covid_19/widgets/abstract_container.dart';
import 'package:tracker_covid_19/widgets/simple_container.dart';
import 'package:tracker_covid_19/widgets/stats_chart.dart';

class StatsContainer extends StatelessWidget {
  StatsContainer({
    super.key,
    required this.data,
  });

  Map<String, double> pieData = {
    // "Active": 12.0,
    // "Recovered": 12.0,
    // "Deaths": 18.0,
  };
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    if (data != null) {
      pieData["Active - ${data.active.toString()}"] =
          double.parse(data.active.toString());
      pieData["Recovered - ${data.recovered.toString()}"] =
          double.parse(data.recovered.toString());
      pieData["Deaths - ${data.deaths.toString()}"] =
          double.parse(data.deaths.toString());
    }
    return Column(children: [
      SizedBox(
        height: 2,
      ),
      heading(context, 'Total', AppColor.primaryBlue),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 11),
        child: SizedBox(
          height: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: AbstractContainer(
                      heading: 'Cases',
                      numbers: data.cases.toString(),
                      bgColor: AppColor.primaryBlue)),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: AbstractContainer(
                      heading: 'Deaths',
                      numbers: data.deaths.toString(),
                      bgColor: AppColor.primaryOrange)),
            ],
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 11),
        child: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: SimpleContainer(
                heading: 'Recovered',
                numbers: data.recovered.toString(),
                textColor: AppColor.primaryBlue,
                horizontal: false,
              )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: SimpleContainer(
                      heading: 'Active',
                      numbers: data.active.toString(),
                      textColor: AppColor.primaryBlue,
                      horizontal: false)),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: SimpleContainer(
                      heading: 'Critical',
                      numbers: data.critical.toString(),
                      textColor: AppColor.primaryOrange,
                      horizontal: false)),
            ],
          ),
        ),
      ),
      StatsChart(pieData: pieData),
      SizedBox(
        height: 10,
      ),
      heading(context, 'Today', AppColor.primaryBlue),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 11),
        child: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: AbstractContainer(
                heading: 'Cases',
                numbers: data.todayCases.toString(),
                bgColor: AppColor.primaryBlue,
                // horizontal: false,
              )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: AbstractContainer(
                heading: 'Recovered',
                numbers: data.todayRecovered.toString(),
                bgColor: Colors.green,
                // horizontal: false,
              )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: AbstractContainer(
                heading: 'Deaths',
                numbers: data.todayDeaths.toString(),
                bgColor: AppColor.primaryOrange,
                // horizontal: false,
              )),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 6,
      ),
      data is CountryStatsModel
          ? Container()
          : SimpleContainer(
              heading: 'Affected Countries',
              numbers: data.affectedCountries.toString(),
              textColor: AppColor.primaryOrange,
              horizontal: true,
            ),
      SizedBox(
        height: 12,
      ),
    ]);
  }

  Align heading(BuildContext context, String text, Color textColor) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: textColor,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracker_covid_19/models/CountryStatsModel.dart';
import 'package:tracker_covid_19/services/utilities/app_color.dart';
import 'package:tracker_covid_19/widgets/country_list_item.dart';
import 'package:tracker_covid_19/widgets/stats_container.dart';

class CountryView extends StatelessWidget {
  static const String id = 'CountryView';
  final CountryStatsModel countryStatsModel =
      Get.arguments as CountryStatsModel;
  CountryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.secondaryWhite,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 8),
            child: GestureDetector(
              onTap: () => Get.close(1),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColor.secondaryBlack,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 22.0, vertical: 11.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CountryListItem(
                    flag: countryStatsModel.countryInfo!.flag.toString(),
                    name: countryStatsModel.country.toString(),
                    cases: countryStatsModel.cases.toString(),
                    todayCase: countryStatsModel.todayCases! > 0),
                StatsContainer(data: countryStatsModel)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tracker_covid_19/controllers/WorldStatsController.dart';
import 'package:tracker_covid_19/services/utilities/app_color.dart';
import 'package:tracker_covid_19/widgets/stats_container.dart';

class WorldStatsTab extends StatelessWidget {
  WorldStatsTab({super.key});

  WorldStatsCotroller worldStatsCotroller = Get.put(WorldStatsCotroller());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => worldStatsCotroller.isLoading.value
          ? Center(
              child: SpinKitRing(color: AppColor.primaryBlue),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.0),
                child:
                    StatsContainer(data: worldStatsCotroller.worldStatsModel!),
              ),
            ),
    );
  }
}

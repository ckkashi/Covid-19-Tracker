import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:tracker_covid_19/models/WorldStatsModel.dart';
import 'package:tracker_covid_19/services/stats_services.dart';
import 'package:tracker_covid_19/views/CheckConnectivityView.dart';

class WorldStatsCotroller extends GetxController {
  var isLoading = false.obs;
  WorldStatsModel? worldStatsModel;

  @override
  Future<void> onInit() async {
    fetchWorldStatsData();
    super.onInit();
  }

  fetchWorldStatsData() async {
    try {
      isLoading(true);
      worldStatsModel = await StatsServices().fetchWorldStatsModel();
      isLoading(false);
    } catch (ex) {
      Get.offAndToNamed(CheckConnectivityView.id);
    }
  }
}

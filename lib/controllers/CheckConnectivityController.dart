import 'package:get/get.dart';
import 'package:tracker_covid_19/controllers/CountryStatsController.dart';
import 'package:tracker_covid_19/controllers/WorldStatsController.dart';
import 'package:tracker_covid_19/services/connectivity_services.dart';
import 'package:tracker_covid_19/views/HomeView.dart';

class CheckConnectivityController extends GetxController {
  @override
  Future<void> onInit() async {
    checkConnection();
    super.onInit();
  }

  checkConnection() async {
    Get.delete<WorldStatsCotroller>();
    Get.delete<CountryStatsController>();
    bool result = await ConnectivityServices().checkConnectivity();
    if (result) {
      Get.offAndToNamed(HomeView.id);
    }
  }
}

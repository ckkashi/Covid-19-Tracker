import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tracker_covid_19/models/CountryStatsModel.dart';
import 'package:tracker_covid_19/services/stats_services.dart';
import 'package:tracker_covid_19/views/CheckConnectivityView.dart';

class CountryStatsController extends GetxController {
  var isLoading = false.obs;
  List<CountryStatsModel>? countryStatsList;
  var searchText = ''.obs;
  @override
  Future<void> onInit() async {
    fetchCountryStatsData();
    super.onInit();
  }

  fetchCountryStatsData() async {
    try {
      isLoading(true);
      countryStatsList = await StatsServices().fetchCountryStatsModel();
      isLoading(false);
    } catch (ex) {
      Get.offAndToNamed(CheckConnectivityView.id);
    }
  }
}

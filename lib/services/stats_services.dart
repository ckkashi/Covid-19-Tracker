import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tracker_covid_19/models/CountryStatsModel.dart';
import 'package:tracker_covid_19/models/WorldStatsModel.dart';
import 'package:tracker_covid_19/services/utilities/app_url.dart';

class StatsServices {
  Future<WorldStatsModel> fetchWorldStatsModel() async {
    final res = await http
        .get(Uri.parse(AppUrls.worldStatsUrl))
        .timeout(const Duration(seconds: 15));
    // print(res.statusCode);
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      return WorldStatsModel.fromJson(data);
    } else {
      // fetchWorldStatsModel();
      throw Exception('Error to fetch world stats..');
    }
  }

  Future<List<CountryStatsModel>> fetchCountryStatsModel() async {
    List<CountryStatsModel> _data = [];
    final res = await http
        .get(Uri.parse(AppUrls.countriesStatsUrl))
        .timeout(const Duration(seconds: 15));
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      for (var item in data) {
        _data.add(CountryStatsModel.fromJson(item));
      }
      return _data;
    } else {
      // fetchCountryStatsModel();
      throw Exception('Error to fetch countries stats..');
    }
  }
}

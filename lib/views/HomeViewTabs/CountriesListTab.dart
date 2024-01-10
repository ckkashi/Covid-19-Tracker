import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tracker_covid_19/controllers/CountryStatsController.dart';
import 'package:tracker_covid_19/models/CountryStatsModel.dart';
import 'package:tracker_covid_19/services/utilities/app_color.dart';
import 'package:tracker_covid_19/views/CountryView.dart';
import 'package:tracker_covid_19/widgets/country_list_item.dart';

class CountriesListTab extends StatelessWidget {
  CountriesListTab({super.key});

  CountryStatsController countryStatsController =
      Get.put(CountryStatsController());

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Obx(
      () => countryStatsController.isLoading.value
          ? const Center(
              child: SpinKitRing(color: AppColor.primaryBlue),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: TextFormField(
                      onChanged: (text) {
                        countryStatsController.searchText(text);
                      },
                      cursorColor: AppColor.primaryBlue,
                      cursorWidth: 2.5,
                      cursorHeight: 25,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColor.primaryBlue,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5),
                      decoration: InputDecoration(
                        hintText: 'Search by country name',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                              color: AppColor.primaryBlue, width: 2.3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                              color: AppColor.primaryBlue, width: 2.3),
                        ),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 10),
                          child: Icon(
                            Icons.search,
                            size: 30,
                          ),
                        ),
                        prefixIconColor: AppColor.primaryBlue,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Visibility(
                    child: Text(countryStatsController.searchText.value),
                    visible: false,
                  ),
                  Expanded(
                    flex: 8,
                    child: ListView.builder(
                      itemCount:
                          countryStatsController.countryStatsList!.length,
                      itemBuilder: (context, index) {
                        CountryStatsModel currentCountry =
                            countryStatsController.countryStatsList![index];
                        RxString searchText = countryStatsController.searchText;
                        countryStatsController.update();
                        if (searchText.value.isEmpty) {
                          return InkWell(
                            // onTap: () => Get.to(CountryView(
                            //     countryStatsModel: countryStatsController
                            //         .countryStatsList![index])),
                            onTap: () => Get.toNamed(CountryView.id,
                                arguments: countryStatsController
                                    .countryStatsList![index]),
                            child: CountryListItem(
                                flag:
                                    currentCountry.countryInfo!.flag.toString(),
                                name: currentCountry.country.toString(),
                                cases: currentCountry.cases.toString(),
                                todayCase: currentCountry.todayCases! > 0),
                          );
                        } else if (currentCountry.country!
                            .toLowerCase()
                            .contains(searchText.value.toLowerCase())) {
                          return InkWell(
                            onTap: () => Get.toNamed(CountryView.id,
                                arguments: countryStatsController
                                    .countryStatsList![index]),
                            child: CountryListItem(
                                flag:
                                    currentCountry.countryInfo!.flag.toString(),
                                name: currentCountry.country.toString(),
                                cases: currentCountry.cases.toString(),
                                todayCase: currentCountry.todayCases! > 0),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

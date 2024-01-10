import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tracker_covid_19/controllers/CheckConnectivityController.dart';
import 'package:tracker_covid_19/services/utilities/app_color.dart';
import 'package:tracker_covid_19/services/utilities/app_string.dart';

class CheckConnectivityView extends StatelessWidget {
  static const String id = 'CheckConnView';
  CheckConnectivityView({super.key});

  CheckConnectivityController checkConnectivityController =
      Get.put(CheckConnectivityController());

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppString.appName,
          style: textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 11.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.public_off,
                color: AppColor.secondaryBlack,
                size: 150,
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'No Internet Connection',
                style: textTheme.headlineSmall!
                    .copyWith(color: AppColor.secondaryBlack),
              ),
              const SizedBox(
                height: 6,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Text(
                  'Open wifi or cellular data that has internet.',
                  textAlign: TextAlign.center,
                  style: textTheme.titleMedium!
                      .copyWith(color: AppColor.secondaryBlack),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              FloatingActionButton(
                onPressed: () {
                  checkConnectivityController.checkConnection();
                },
                backgroundColor: AppColor.secondaryBlack,
                child: const Icon(Icons.refresh),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

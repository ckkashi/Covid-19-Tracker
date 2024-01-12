import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tracker_covid_19/services/utilities/app_color.dart';
import 'package:tracker_covid_19/views/CheckConnectivityView.dart';
import 'package:tracker_covid_19/views/CountryView.dart';
import 'package:tracker_covid_19/views/HomeView.dart';
import 'package:sizer/sizer.dart';
import 'package:tracker_covid_19/views/SplashView.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColor.primaryBlue,
          scaffoldBackgroundColor: AppColor.secondaryWhite,
          fontFamily: 'Poppins',
          appBarTheme: const AppBarTheme(
              elevation: 0,
              centerTitle: true,
              backgroundColor: AppColor.secondaryWhite),
        ),
        initialRoute: SplashView.id,
        routes: {
          SplashView.id: (context) => const SplashView(),
          CheckConnectivityView.id: (context) => CheckConnectivityView(),
          HomeView.id: (context) => const HomeView(),
          CountryView.id: (context) => CountryView(),
        },
      );
    });
  }
}

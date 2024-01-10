import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tracker_covid_19/services/utilities/app_color.dart';
import 'package:tracker_covid_19/services/utilities/app_string.dart';
import 'package:tracker_covid_19/views/HomeViewTabs/CountriesListTab.dart';
import 'package:tracker_covid_19/views/HomeViewTabs/WorldStatsTab.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const String id = 'HomeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Tab> _tabs = const [
    Tab(
      text: 'All',
    ),
    Tab(
      text: 'Countries',
    ),
  ];

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            AppString.appName,
            style: textTheme.headlineSmall,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: Text(
                    'Explore Covid-19 regular updates on this app',
                    style: textTheme.labelLarge!
                        .copyWith(color: AppColor.secondaryGrey),
                  )),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColor.primaryBlue,
                        borderRadius: BorderRadius.circular(10.0)),
                    margin: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 22.0),
                    child: Container(
                      margin: const EdgeInsets.all(3.0),
                      height: kToolbarHeight - 2.0,
                      decoration: BoxDecoration(
                        color: AppColor.primaryBlue,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TabBar(
                        controller: _tabController,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: AppColor.secondaryWhite),
                        labelColor: AppColor.secondaryBlack,
                        unselectedLabelColor: AppColor.secondaryWhite,
                        labelStyle: textTheme.titleMedium,
                        tabs: _tabs,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: TabBarView(controller: _tabController, children: [
                WorldStatsTab(),
                CountriesListTab(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

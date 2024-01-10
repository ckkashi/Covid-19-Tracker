import 'package:flutter/material.dart';
import 'package:tracker_covid_19/services/utilities/app_color.dart';

class CountryListItem extends StatelessWidget {
  final String flag;
  final String name;
  final String cases;
  final bool todayCase;
  const CountryListItem(
      {super.key,
      required this.flag,
      required this.name,
      required this.cases,
      required this.todayCase});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Hero(
      tag: 'flagTag${name}',
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: AppColor.secondaryWhite,
          boxShadow: const [
            BoxShadow(
              spreadRadius: 0,
              blurRadius: 2,
              color: AppColor.secondaryGrey,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    flag,
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      softWrap: false,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.headlineSmall!.copyWith(
                          color: AppColor.secondaryBlack,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      cases,
                      style: textTheme.titleMedium!.copyWith(
                          color: AppColor.primaryBlue,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

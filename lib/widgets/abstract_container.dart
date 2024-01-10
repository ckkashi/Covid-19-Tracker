import 'package:flutter/material.dart';
import 'package:tracker_covid_19/services/utilities/app_color.dart';

class AbstractContainer extends StatelessWidget {
  final String heading;
  final String numbers;
  final Color bgColor;
  const AbstractContainer(
      {required this.heading,
      required this.numbers,
      required this.bgColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            heading,
            style: textTheme.bodyLarge!.copyWith(
                color: AppColor.secondaryWhite, fontWeight: FontWeight.bold),
          ),
          Text(
            numbers,
            style: textTheme.titleLarge!.copyWith(
                color: AppColor.secondaryWhite, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

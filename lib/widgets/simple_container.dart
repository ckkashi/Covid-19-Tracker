import 'package:flutter/material.dart';
import 'package:tracker_covid_19/services/utilities/app_color.dart';

class SimpleContainer extends StatelessWidget {
  final String heading;
  final String numbers;
  final Color textColor;
  final bool horizontal;
  const SimpleContainer(
      {required this.heading,
      required this.numbers,
      required this.textColor,
      required this.horizontal,
      super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
          color: AppColor.secondaryWhite,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const [
            BoxShadow(
              color: AppColor.secondaryGrey,
              spreadRadius: 0,
              blurRadius: 2,
            )
          ]),
      child: horizontal
          ? Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    heading,
                    style: textTheme.bodyMedium!.copyWith(
                        color: textColor, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    numbers,
                    style: textTheme.titleLarge!.copyWith(
                        color: textColor, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  heading,
                  style: textTheme.bodyMedium!
                      .copyWith(color: textColor, fontWeight: FontWeight.bold),
                ),
                Text(
                  numbers,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleLarge!
                      .copyWith(color: textColor, fontWeight: FontWeight.bold),
                )
              ],
            ),
    );
  }
}

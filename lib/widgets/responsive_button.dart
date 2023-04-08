import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/misc/colors.dart';
import 'package:travelapp/widgets/app_text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../cubit/app_cubit.dart';
import '../pages/Services/auth_service.dart';

// ignore: must_be_immutable
class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  String text;
  bool goesWeb;
  String cityName;
  int people;
  DateTime checkin;
  DateTime checkout;
  ResponsiveButton(
      {super.key,
      required this.checkin,
      required this.checkout,
      this.cityName = '',
      this.people = 2,
      this.width = 120,
      this.isResponsive = false,
      this.goesWeb = false,
      this.text = "Book Trip Now"});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: goesWeb
            ? () async {
                String url =
                    "https://www.booking.com/searchresults.it.html?ss=$cityName&group_adults=$people&checkin=${checkin.year}-${checkin.month}-${checkin.day}&checkout=${checkout.year}-${checkout.month}-${checkout.day}"; //AAAA-MM-DD
                var urllaunchable = await canLaunch(url);
                if (urllaunchable) {
                  await launch(url);
                } else {
                  print("URL can't be launched.");
                }
              }
            : () async {
                await AuthService().signInWithGoogle();
                // ignore: use_build_context_synchronously
                BlocProvider.of<AppCubits>(context).getData();
              },
        child: Container(
          width: isResponsive == true ? double.maxFinite : width,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.mainColor,
          ),
          child: Row(
            mainAxisAlignment: isResponsive == true
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              isResponsive == true
                  ? Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: AppText(
                        text: text,
                        color: Colors.white,
                      ),
                    )
                  : Container(),
              isResponsive == true
                  ? Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: const Icon(
                        Icons.navigate_next,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:travelapp/misc/colors.dart';
import 'package:travelapp/widgets/app_text.dart';

// ignore: must_be_immutable
class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  String text;
  ResponsiveButton(
      {super.key,
      this.width = 120,
      this.isResponsive = false,
      this.text = "Book Trip Now"});

  @override
  Widget build(BuildContext context) {
    return Flexible(
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
    );
  }
}

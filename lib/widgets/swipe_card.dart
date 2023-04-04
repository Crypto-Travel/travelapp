import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:travelapp/widgets/app_large_text.dart';

class SwipeCard extends StatelessWidget {
  final Color color;
  final String text;

  const SwipeCard(
      {super.key, this.color = Colors.grey, this.text = "Ecco il risultato!"});

  @override
  Widget build(BuildContext context) {
    return Swipable(
      verticalSwipe: false,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              height: double.maxFinite,
              width: double.maxFinite,
            ),
          ),
          Positioned(
            child: AppLargeText(
              text: text,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}

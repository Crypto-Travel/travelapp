import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/widgets/app_large_text.dart';
import 'package:travelapp/widgets/app_text.dart';
import 'package:travelapp/widgets/responsive_button.dart';

import '../misc/colors.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _controller = PageController();
  List images = [
    "assets/images/mondo.jpg",
    "assets/images/questionario.jpg",
    "assets/images/enjoy.jpg",
  ];
  List texts = [
    "Find destination",
    "Plan your trip",
    "Enjoy the journey",
  ];
  List subTexts = [
    "Choose your favorite destination from those suggested",
    "Customize the trip details according to your needs",
    "Have new experiences and think no more",
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (_, index) {
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
                margin: const EdgeInsets.only(
                  bottom: 100,
                  left: 20,
                  right: 20,
                ),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 300),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppLargeText(
                        text: texts[index],
                        color: Colors.black,
                        size: 27,
                      ),
                      const SizedBox(height: 20),
                      AppText(
                        text: subTexts[index],
                        color: Colors.black,
                        size: 19,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 150,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: SmoothPageIndicator(
                controller: _controller,
                count: images.length,
                effect: const ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  activeDotColor: AppColors.mainColor,
                  dotHeight: 18,
                  dotWidth: 18,
                  expansionFactor: 4,
                  spacing: 5.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: ResponsiveButton(
              isResponsive: true,
              text: "Sign in with google",
              checkin: DateTime.now(),
              checkout: DateTime.now(),
            ),
          ),
        ],
      ),
    );
  }
}

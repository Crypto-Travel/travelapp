import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

import '../cubit/app_cubit.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _controller = PageController();
  List images = [
    "assets/images/questionario.jpg",
    "assets/images/mondo.jpg",
    "assets/images/enjoy.jpg",
  ];
  List texts = [
    "Compila il questionario",
    "Scegli la meta",
    "Goditi il viaggio",
  ];
  List subTexts = [
    "Rispondi alle domande e scopri la tua destinazione ideale per il tuo prossimo viaggio",
    "Scegli la tua destinazione preferita tra quelle proposte",
    "Fai nuove esperienze e non pensare più a nulla",
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
                      Text(
                        texts[index],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 27,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        subTexts[index],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                        ),
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
                  activeDotColor: Colors.purple,
                  dotHeight: 18,
                  dotWidth: 18,
                  expansionFactor: 4,
                  spacing: 5.0,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {
                  int currentPage = _controller.page?.toInt() ?? 0;
                  if (currentPage == images.length - 1) {
                    BlocProvider.of<AppCubits>(context).getData();
                  } else {
                    _controller.animateToPage(
                      currentPage + 1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  }
                },
                child: const Text(
                  "Avanti",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

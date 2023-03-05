import 'package:flutter/material.dart';

class CityView extends StatefulWidget {
  const CityView({super.key});

  @override
  State<CityView> createState() => _CityViewState();
}

class _CityViewState extends State<CityView> {
  @override
  Widget build(BuildContext context) {
    var longDesc =
        '''descrizione lunga lunga lunga lungaaaaaa lunghissima assai molto lunga''';
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SafeArea(
            child: Stack(
      alignment: Alignment.topLeft,
      children: [
        Positioned(
          top: 0,
          height: screenHeight * 0.45,
          child: Image.asset("assets/images/city_image.jpg"),
        ),
        Positioned(
          top: screenHeight * 0.4,
          child: Container(
              padding: const EdgeInsets.all(8.0),
              width: screenWidth,
              height: screenHeight * 0.6,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('City Name'),
                  const Text('short desc'),
                  Text(longDesc)
                ],
              )),
        ),
      ],
    )));
  }
}

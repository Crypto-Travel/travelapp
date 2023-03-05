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
      body: Container(
        child: const Text('ciao'),
      ),
    );
  }
}

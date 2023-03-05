import 'package:flutter/material.dart';
import 'package:travelapp/utilities/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteClr,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Positioned(
                top: 20,
                left: 20,
                child: Text(
                  "Hi, Username",
                  style: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Positioned(
                top: 20,
                right: 20,
                child: Image.asset(
                  "assets/icons/Google.png",
                  height: 35,
                  width: 35,
                ),
              ),
              Positioned(
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.fromLTRB(25, 70, 25, 0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Naviga con noi!!!!!!!!!",
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(
                        IconData(0xe567, fontFamily: 'MaterialIcons'),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
          child: Stack(alignment: Alignment.center, children: [
            Positioned(
              top: 25,
              left: 20,
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: 'Hi  '),
                    TextSpan(
                        text: 'Username,',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ],
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
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 20),
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                              text: 'Where do you want to go my nigga?',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Naviga con noi!!!!!!!!!",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
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
                  Container(
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    width: double.infinity,
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                              text: 'Explore Cities',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 10,
                    ),
                    width: double.infinity,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: const [
                          Text(
                            "All",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Popular",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Recommended",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Most viewed",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Shittiest",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 10,
                    ),
                    width: double.infinity,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                24,
                              ),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset("assets/images/bho.jpg"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

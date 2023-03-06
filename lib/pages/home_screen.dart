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
            alignment: Alignment.bottomCenter,
            children: [
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
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                  text: 'Where do you want to go my nigga?',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26,
                                    color: Colors.black,
                                  )),
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
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        width: double.infinity,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 20,
                              ),
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
                      SizedBox(
                        width: double.infinity,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              buildCard(),
                              buildCard(),
                              buildCard(),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        width: double.infinity,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              buildCard(),
                              buildCard(),
                              buildCard(),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 125,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 70,
                child: InkWell(
                  onTap: () => {},
                  child: Container(
                    height: 55,
                    width: 370,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(300)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.query_stats_outlined,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Inizia il questionario",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 10,
                        ),
                      ],
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(
                          30,
                        ),
                        topEnd: Radius.circular(
                          30,
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 65,
                    child: Icon(
                      Icons.home_outlined,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
                  const Positioned(
                    child: Icon(
                      Icons.favorite_border_outlined,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
                  const Positioned(
                    right: 65,
                    child: Icon(
                      Icons.person_outline_sharp,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildCard() => Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          24,
        ),
      ),
      child: Stack(
        children: [
          Image.asset(
            "assets/images/spiaggia.jpg",
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 5,
            top: 140,
            left: 5,
            right: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Positioned(
            bottom: 35,
            left: 15,
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'Putamadre, caserta',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 10,
            child: Row(
              children: [
                const Icon(
                  Icons.place_outlined,
                  size: 17,
                ),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: 'Napoli',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                const Icon(
                  Icons.star_border_outlined,
                  size: 17,
                ),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: '4,5',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

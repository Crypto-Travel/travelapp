import 'package:flutter/material.dart';
import 'package:travelapp/utilities/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List categories = [
    "All",
    "Popular",
    "Recommended",
    "Most viewed",
    "Shittiest"
  ];
  late List<TextStyle> bhos = List.generate(
    categories.length,
    (index) => const TextStyle(
      fontSize: 18,
      color: Colors.black,
    ),
  );

  TextStyle? oldbho = const TextStyle(
    fontSize: 18,
    color: Colors.black,
  );
  TextStyle? bhold = const TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
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
                      const Padding(
                          padding: EdgeInsets.fromLTRB(40, 0, 40, 20),
                          child: Text(
                            'Where do you want to go my nigga?',
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
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
                        child: const Text(
                          'Explore Cities',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
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
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    bhos[0] = bhold!;
                                    for (int i = 0; i < bhos.length; i++) {
                                      if (i != 0) {
                                        bhos[i] = oldbho!;
                                      }
                                    }
                                  });
                                },
                                child: Text(
                                  categories[0],
                                  style: bhos[0],
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    bhos[1] = bhold!;
                                    for (int i = 0; i < bhos.length; i++) {
                                      if (i != 1) {
                                        bhos[i] = oldbho!;
                                      }
                                    }
                                  });
                                },
                                child: Text(
                                  categories[1],
                                  style: bhos[1],
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    bhos[2] = bhold!;
                                    for (int i = 0; i < bhos.length; i++) {
                                      if (i != 2) {
                                        bhos[i] = oldbho!;
                                      }
                                    }
                                  });
                                },
                                child: Text(
                                  categories[2],
                                  style: bhos[2],
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    bhos[3] = bhold!;
                                    for (int i = 0; i < bhos.length; i++) {
                                      if (i != 3) {
                                        bhos[i] = oldbho!;
                                      }
                                    }
                                  });
                                },
                                child: Text(
                                  categories[3],
                                  style: bhos[3],
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    bhos[4] = bhold!;
                                    for (int i = 0; i < bhos.length; i++) {
                                      if (i != 4) {
                                        bhos[i] = oldbho!;
                                      }
                                    }
                                  });
                                },
                                child: Text(
                                  categories[4],
                                  style: bhos[4],
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
                              buildCard("assets/images/spiaggia.jpg",
                                  "Putamadre, Caserta", "Napoli"),
                              buildCard("assets/images/bho.jpg",
                                  "Portofino, Reggio-Emilia", "Ghandi"),
                              buildCard("assets/images/welcomePage.jpg",
                                  "Mizzica, Zurigo", "Alaska"),
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
                              buildCard("assets/images/spiaggia.jpg",
                                  "Putamadre, Caserta", "Napoli"),
                              buildCard("assets/images/bho.jpg",
                                  "Portofino, Reggio-Emilia", "Ghandi"),
                              buildCard("assets/images/welcomePage.jpg",
                                  "Mizzica, Zurigo", "Alaska"),
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
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                      Icons.history_outlined,
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

Widget buildCard(String image, String location, String nation) => Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          24,
        ),
      ),
      child: Stack(
        children: [
          Image.asset(
            image,
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
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: location,
                    style: const TextStyle(
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
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: nation,
                        style: const TextStyle(
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/misc/colors.dart';
import 'package:travelapp/pages/questionarioPage.dart';
import 'package:travelapp/pages/swipe_page.dart';
import 'package:travelapp/widgets/app_large_text.dart';
import 'package:travelapp/widgets/app_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../pages/Services/data_service.dart';

import '../cubit/app_cubit.dart';
import '../cubit/app_cubit_states.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  bool isFavourite =
      false; //non dovrà essere inizializzato quando ci sarà il database

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 150,
      ),
    );
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  var images = {
    "kayak.jpg": "Kayaking",
    "ballooning.jpg": "Ballooning",
    "hiking.jpg": "Hiking",
    "snorkling.jpg": "Snorkling"
  };
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
        body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      if (state is LoadedState || state is HistoryLoaded) {
        var info = state.places;
        var user = state.user;
        return FadeTransition(
          opacity: _animationController,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Row(children: [
                    AppLargeText(
                      text:
                          "Welcome, ${FirebaseAuth.instance.currentUser!.displayName!}",
                      size: 18,
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.grey.withOpacity(0.5),
                          image: DecorationImage(
                              image: NetworkImage(FirebaseAuth
                                  .instance.currentUser!.photoURL!))),
                    )
                  ]),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: AppLargeText(
                    text: "Discover",
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      labelPadding: const EdgeInsets.only(left: 20, right: 20),
                      controller: tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: CircleTabIndicator(
                          color: AppColors.mainColor, radius: 4),
                      tabs: const [
                        Tab(text: "Places"),
                        Tab(text: "Favourites"),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  height: 300,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      ListView.builder(
                        itemCount: info.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              BlocProvider.of<AppCubits>(context)
                                  .detailPage(info[index], user);
                            },
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    width: 230,
                                    height: 300,
                                  ),
                                  Positioned(
                                    top: 10,
                                    left: 15,
                                    child: Container(
                                      width: 200,
                                      height: 220,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                info[index].imageUrl),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    height: 56,
                                    left: 5,
                                    right: 5,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 15,
                                    right: 20,
                                    child: GestureDetector(
                                      onTap: () {
                                        DataServices data = DataServices();
                                        data.postCity(
                                            user.user_id, info[index].id);
                                        setState(
                                          () {
                                            if (isFavourite == false) {
                                              isFavourite = true;
                                            } else {
                                              isFavourite = false;
                                            }
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Colors.white,
                                        ),
                                        child: Icon(
                                          Icons.favorite_rounded,
                                          color: isFavourite
                                              ? Colors.red
                                              : Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 35,
                                    left: 15,
                                    child: AppLargeText(
                                        text: info[index].name, size: 18),
                                  ),
                                  Positioned(
                                    bottom: 15,
                                    left: 10,
                                    child: Row(children: [
                                      const Icon(
                                        Icons.place_outlined,
                                        size: 17,
                                      ),
                                      AppText(
                                        text: info[index].location,
                                        color: Colors.black87,
                                      ),
                                      const SizedBox(
                                        width: 40,
                                      ),
                                      const Icon(
                                        Icons.star,
                                        size: 18,
                                        color: Colors.yellow,
                                      ),
                                      AppText(
                                        text: "${info[index].stars}/5",
                                        color: Colors.black87,
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      const Text("There"),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(
                        text: "Explore more",
                        size: 22,
                      ),
                      AppText(text: "See all", color: AppColors.textColor1),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 120,
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(left: 20),
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 30),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  if (index % 2 == 0) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                SwipePage())));
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                QuestionarioPage())));
                                  }
                                },
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 80,
                                      ),
                                      Positioned(
                                          left: 5,
                                          top: 5,
                                          child: Container(
                                            height: 70,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white,
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  "assets/images/${images.keys.elementAt(index)}",
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                child: AppText(
                                  text: images.values.elementAt(index),
                                  color: AppColors.textColor2,
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        );
      } else {
        return Container(); //anche altro
      }
    }));
  }
}

// ignore: must_be_immutable
class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}

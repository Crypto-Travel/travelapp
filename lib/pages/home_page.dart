import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/misc/colors.dart';
import 'package:travelapp/model/favorite_model.dart';
import 'package:travelapp/widgets/app_large_text.dart';
import 'package:travelapp/widgets/app_text.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';
import '../model/city_model.dart';
import '../model/data_model.dart';
import '../pages/Services/data_service.dart';

import '../cubit/app_cubit.dart';
import '../cubit/app_cubit_states.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;

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
    "skiing.jpg": "Skiing",
    "surfing.jpg": "Surfing",
    "camping.jpg": "Camping",
    "Sightseeing.jpg": "Sightseeing",
    "hiking.jpg": "Hiking",
    "snorkling.jpg": "Scuba Diving"
  };

  List<CityModel> makeList(
      List<DataModel> info, List<FavoriteModel> favorites) {
    List<CityModel> outPut = [];
    for (int i = 0; i < info.length; i++) {
      bool found = false;
      int j = 0;
      for (j; j < favorites.length; j++) {
        if (favorites[j].placeid == info[i].id) {
          found = true;
          break;
        }
      }
      if (found) {
        outPut.add(CityModel(info[i].name, info[i].location, info[i].stars,
            info[i].imageUrl, found, i));
      }
    }

    return outPut;
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
        body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      if (state is LoadedState) {
        var info = state.places;
        var user = state.user;
        var favorites = state.favorites;
        List<CityModel> actualFavorites = makeList(info, favorites);
        actualFavorites.sort(
          (a, b) => a.city_name.compareTo(b.city_name),
        );
        return FadeTransition(
          opacity: _animationController,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.logout),
                          onPressed: () {
                            BlocProvider.of<AppCubits>(context).logOut();
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    const AlertDialog(
                                      title: Text("Logged Out"),
                                      content: Text("Successfully logged out"),
                                    ));
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
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
                      ),
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
                  Align(
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
                        Tab(text: "Favorites"),
                      ],
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
                                DataServices data = DataServices();
                                data.postCity(user.user_id, info[index].id);
                                bool found = false;
                                int j = 0;
                                for (j; j < favorites.length; j++) {
                                  if (favorites[j].placeid == info[index].id) {
                                    found = true;
                                    break;
                                  }
                                }
                                if (found) {
                                  BlocProvider.of<AppCubits>(context)
                                      .detailPage(
                                          info[index], user, favorites[j]);
                                } else {
                                  FavoriteModel? notFav =
                                      FavoriteModel(placeid: 0);
                                  BlocProvider.of<AppCubits>(context)
                                      .detailPage(info[index], user, notFav);
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
                                    const SizedBox(
                                      width: 230,
                                      height: 300,
                                    ),
                                    Positioned(
                                      top: 10,
                                      left: 15,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: CachedNetworkImage(
                                          key: UniqueKey(),
                                          imageUrl: info[index].imageUrl,
                                          width: 200,
                                          height: 220,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              const Center(
                                            child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator()),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
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
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                        right: 20,
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              size: 18,
                                              color: Colors.yellow,
                                            ),
                                            AppText(
                                              text: "${info[index].stars}/5",
                                              color: Colors.black87,
                                            ),
                                          ],
                                        )),
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
                                      ]),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        ListView.builder(
                          itemCount: actualFavorites.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                DataServices data = DataServices();
                                data.postCity(user.user_id,
                                    info[actualFavorites[index].index].id);
                                BlocProvider.of<AppCubits>(context).detailPage(
                                    info[actualFavorites[index].index],
                                    user,
                                    FavoriteModel(placeid: 1));
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
                                    const SizedBox(
                                      width: 230,
                                      height: 300,
                                    ),
                                    Positioned(
                                      top: 10,
                                      left: 15,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: CachedNetworkImage(
                                          key: UniqueKey(),
                                          imageUrl:
                                              actualFavorites[index].city_image,
                                          width: 200,
                                          height: 220,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              const Center(
                                            child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator()),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
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
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 15,
                                      right: 20,
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Colors.white,
                                        ),
                                        child: const Icon(
                                            Icons.favorite_rounded,
                                            color: Colors.red),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 35,
                                      left: 15,
                                      child: AppLargeText(
                                          text:
                                              actualFavorites[index].city_name,
                                          size: 18),
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
                                          text: actualFavorites[index]
                                              .city_location,
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
                                          text:
                                              "${actualFavorites[index].city_stars}/5",
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
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: AppLargeText(
                      text: "Activities",
                      size: 22,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 120,
                    width: double.maxFinite,
                    margin: const EdgeInsets.only(left: 20),
                    child: ListView.builder(
                        itemCount: images.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () /*async*/ {
                                    List<DataModel> activity = actList(
                                        info,
                                        images.values
                                            .elementAt(index)
                                            .toLowerCase());
                                    BlocProvider.of<AppCubits>(context)
                                        .activityPage(
                                            activity,
                                            user,
                                            images.values.elementAt(index),
                                            favorites);
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
                                        const SizedBox(
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
                                AppText(
                                  text: images.values.elementAt(index),
                                  color: AppColors.textColor2,
                                )
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        );
      } else {
        return Container(); //anche altro
      }
    }));
  }
}

List<DataModel> actList(List<DataModel> info, String actName) {
  List<DataModel> outPut = [];
  for (int i = 0; i < info.length; i++) {
    if (info[i].activity == actName) {
      outPut.add(info[i]);
    }
  }
  return outPut;
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

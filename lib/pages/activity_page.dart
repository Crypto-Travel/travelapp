import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/widgets/app_large_text.dart';

import '../cubit/app_cubit.dart';
import '../cubit/app_cubit_states.dart';
import '../model/favorite_model.dart';
import '../widgets/app_text.dart';
import 'Services/data_service.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage>
    with SingleTickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        ActivityState activity = state as ActivityState;
        return Scaffold(
          body: FadeTransition(
            opacity: _animationController,
            child: SizedBox(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Stack(
                children: [
                  SafeArea(
                    child: Positioned(
                      left: 5,
                      top: 50,
                      child: IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).getData();
                        },
                        icon: const Icon(Icons.arrow_back_rounded),
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 50, left: 16, right: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(text: activity.activityName),
                          Expanded(
                            child: ListView.builder(
                              itemCount: activity.activities.length,
                              itemBuilder: (context, index) => Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    DataServices data = DataServices();
                                    data.postCity(activity.user.user_id,
                                        activity.activities[index].id);
                                    bool found = false;
                                    int j = 0;
                                    for (j;
                                        j < activity.favorites.length;
                                        j++) {
                                      if (activity.favorites[j].placeid ==
                                          activity.activities[index].id) {
                                        found = true;
                                        break;
                                      }
                                    }
                                    if (found) {
                                      BlocProvider.of<AppCubits>(context)
                                          .detailPage(
                                              activity.activities[index],
                                              activity.user,
                                              activity.favorites[j]);
                                    } else {
                                      FavoriteModel notFav =
                                          FavoriteModel(placeid: 0);
                                      BlocProvider.of<AppCubits>(context)
                                          .detailPage(
                                              activity.activities[index],
                                              activity.user,
                                              notFav);
                                    }
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 80,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              fit: BoxFit.fitWidth,
                                              image: NetworkImage(activity
                                                  .activities[index].imageUrl)),
                                        ),
                                      ),
                                      Positioned(
                                        right: 5,
                                        top: 5,
                                        bottom: 5,
                                        child: Container(
                                          alignment: Alignment.topCenter,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10),
                                                child: AppText(
                                                  text: activity
                                                      .activities[index].name,
                                                  size: 21,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  AppText(
                                                    text: activity
                                                        .activities[index]
                                                        .location,
                                                    size: 18,
                                                    color: Colors.black87,
                                                  ),
                                                  const Icon(
                                                    Icons.place_outlined,
                                                    size: 18,
                                                    color: Colors.black87,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/widgets/app_large_text.dart';

import '../cubit/app_cubit.dart';
import '../cubit/app_cubit_states.dart';
import '../model/favorite_model.dart';
import '../widgets/app_text.dart';
import 'Services/data_service.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

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
                          BlocProvider.of<AppCubits>(context).goHome();
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
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                              ),
                              itemCount: activity.activities.length,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  DataServices data = DataServices();
                                  data.postCity(activity.user.user_id,
                                      activity.activities[index].id);
                                  bool found = false;
                                  int j = 0;
                                  for (j; j < activity.favorites.length; j++) {
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
                                      activity.favorites[j],
                                    );
                                  } else {
                                    FavoriteModel notFav =
                                        FavoriteModel(placeid: 0);
                                    BlocProvider.of<AppCubits>(context)
                                        .detailPage(
                                      activity.activities[index],
                                      activity.user,
                                      notFav,
                                    );
                                  }
                                },
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: CachedNetworkImage(
                                        key: UniqueKey(),
                                        imageUrl:
                                            activity.activities[index].imageUrl,
                                        fit: BoxFit.cover,
                                        height: double.maxFinite,
                                        width: double.maxFinite,
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
                                    Positioned(
                                      right: 5,
                                      top: 105,
                                      bottom: 5,
                                      left: 5,
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 160,
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 2),
                                              child: AppText(
                                                text: activity
                                                    .activities[index].name,
                                                size: 22,
                                                color: Colors.white,
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
                                                  size: 13,
                                                  color: Colors.white,
                                                ),
                                                const Icon(
                                                  Icons.place_outlined,
                                                  size: 10,
                                                  color: Colors.white,
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

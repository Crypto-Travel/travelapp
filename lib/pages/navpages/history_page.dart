import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/pages/Services/data_service.dart';
import 'package:travelapp/widgets/app_text.dart';

import '../../cubit/app_cubit.dart';
import '../../cubit/app_cubit_states.dart';
import '../../model/favorite_model.dart';
import '../../widgets/app_large_text.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
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
    DataServices data = DataServices();
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is LoadedState) {
            // ignore: unused_local_variable
            var info = state.places;
            var history = state.history;
            var user = state.user;
            var favorites = state.favorites;

            return SafeArea(
              child: FadeTransition(
                opacity: _animationController,
                child: Scaffold(
                  backgroundColor: Colors.white,
                  body: Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 16, right: 16, bottom: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            AppLargeText(text: "History"),
                            Expanded(child: Container()),
                            GestureDetector(
                              child: AppText(
                                text: "Delete all",
                              ),
                              onTap: () {
                                setState(() {
                                  history.removeRange(0, history.length);

                                  data.deleteAllHistory(user.user_id);
                                });
                              },
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: history.length,
                            itemBuilder: (context, index) => Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: GestureDetector(
                                onTap: () {
                                  int i = 0;
                                  for (i; i < info.length; i++) {
                                    if (info[i].id == history[index].placeid) {
                                      break;
                                    }
                                  }
                                  bool found = false;
                                  int j = 0;
                                  for (j; j < favorites.length; j++) {
                                    if (favorites[j].placeid ==
                                        history[index].placeid) {
                                      found = true;
                                      break;
                                    }
                                  }
                                  if (found) {
                                    BlocProvider.of<AppCubits>(context)
                                        .detailPage(
                                            info[i], user, favorites[j]);
                                  } else {
                                    FavoriteModel notFav =
                                        FavoriteModel(placeid: 0);
                                    BlocProvider.of<AppCubits>(context)
                                        .detailPage(info[i], user, notFav);
                                  }
                                },
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 40),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: CachedNetworkImage(
                                          key: UniqueKey(),
                                          imageUrl: history[index].imageUrl,
                                          height: 80,
                                          width: double.maxFinite,
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
                                      right: 50,
                                      top: 5,
                                      bottom: 5,
                                      child: Container(
                                        alignment: Alignment.topCenter,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: AppText(
                                                text: history[index].placename,
                                                size: 21,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                AppText(
                                                  text: history[index].location,
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
                                    Positioned(
                                        right: -10,
                                        top: 15,
                                        child: IconButton(
                                          icon: const Icon(Icons.cancel),
                                          onPressed: () {
                                            data.deleteHistory(
                                                history[index].serial);
                                            setState(() {
                                              history.removeAt(index);
                                            });
                                          },
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

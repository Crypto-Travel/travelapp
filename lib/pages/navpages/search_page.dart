import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/model/city_model.dart';
import 'package:travelapp/widgets/app_text.dart';

import '../../cubit/app_cubit.dart';
import '../../cubit/app_cubit_states.dart';
import '../../model/data_model.dart';
import '../../model/favorite_model.dart';
import '../../widgets/app_large_text.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

List<CityModel> makeList(List<DataModel> info, List<FavoriteModel> favorites) {
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
    outPut.add(CityModel(info[i].name, info[i].location, info[i].stars,
        info[i].imageUrl, found, i));
  }

  return outPut;
}

class _SearchPageState extends State<SearchPage>
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

  List<CityModel>? display_list = null;
  late List<CityModel> main_list;
  void updateList(String value) {
    setState(() {
      display_list = main_list
          .where((element) =>
              element.city_name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is LoadedState) {
            var info = state.places;
            var user = state.user;
            var favorites = state.favorites;
            main_list = makeList(info, favorites);
            main_list.sort(
              (a, b) => a.city_name.compareTo(b.city_name),
            );
            display_list == null
                ? display_list = main_list
                : display_list = display_list;
            return SafeArea(
              child: FadeTransition(
                opacity: _animationController,
                child: Scaffold(
                  backgroundColor: Colors.white,
                  body: Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 16, right: 16, bottom: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: "Search for a City"),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          onChanged: (value) => updateList(value),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            hintText: "eg: Rome",
                            prefixIcon: const Icon(Icons.search),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: display_list?.length,
                            itemBuilder: (context, index) => ListTile(
                              onTap: () {
                                if (display_list![index].isfav) {
                                  FavoriteModel isfav =
                                      FavoriteModel(placeid: 1);
                                  BlocProvider.of<AppCubits>(context)
                                      .detailPage(
                                          info[display_list![index].index],
                                          user,
                                          isfav);
                                } else {
                                  FavoriteModel isfav =
                                      FavoriteModel(placeid: 0);
                                  BlocProvider.of<AppCubits>(context)
                                      .detailPage(
                                          info[display_list![index].index],
                                          user,
                                          isfav);
                                }
                              },
                              title: AppLargeText(
                                text: display_list![index].city_name,
                                size: 20,
                              ),
                              subtitle: AppText(
                                  text: display_list![index].city_location),
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
            return const Scaffold();
          }
        },
      ),
    );
  }
}

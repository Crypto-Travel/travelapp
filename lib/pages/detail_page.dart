import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/cubit/app_cubit_states.dart';
import 'package:travelapp/misc/colors.dart';
import 'package:travelapp/widgets/app_buttons.dart';
import 'package:travelapp/widgets/app_large_text.dart';
import 'package:travelapp/widgets/app_text.dart';
import 'package:travelapp/widgets/responsive_button.dart';

import '../cubit/app_cubit.dart';
import 'Services/data_service.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
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

  DataServices data = DataServices();

  bool heart = false;
  bool firstTime = true;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        DetailState detail = state as DetailState;
        return Scaffold(
          body: FadeTransition(
            opacity: _animationController,
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.maxFinite,
                height: 950,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      child: Container(
                        width: double.maxFinite,
                        height: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(detail.place.imageUrl),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
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
                    Positioned(
                      top: 265,
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        width: MediaQuery.of(context).size.width,
                        height: 680,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppLargeText(
                                    text: detail.place.name,
                                    color: Colors.black.withOpacity(0.8),
                                  ),
                                  AppLargeText(
                                    text: detail.place.price,
                                    color: AppColors.mainColor,
                                    size: 25,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: AppColors.mainColor,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  AppText(
                                      text: detail.place.location,
                                      color: AppColors.textColor1),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Wrap(
                                    children: List.generate(
                                      5,
                                      (index) {
                                        return Icon(
                                          double.parse(detail.place.stars) -
                                                      double.parse(detail
                                                              .place.stars)
                                                          .floor() >
                                                  0
                                              ? index.toDouble() ==
                                                      double.parse(detail
                                                              .place.stars)
                                                          .floor()
                                                  ? Icons.star_half
                                                  : Icons.star
                                              : Icons.star,
                                          color: index.toDouble() <
                                                  double.parse(
                                                      detail.place.stars)
                                              ? AppColors.starColor
                                              : AppColors.textColor2,
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  AppText(
                                    text:
                                        "(${double.parse(detail.place.stars)})",
                                    color: AppColors.textColor2,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              AppLargeText(
                                text: "People",
                                color: Colors.black.withOpacity(0.8),
                                size: 20,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              AppText(
                                text: "Number of people in your group",
                                color: AppColors.textColor2,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                children: List.generate(
                                  5,
                                  (index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = index;
                                        });
                                      },
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        child: AppButtons(
                                          size: 50,
                                          color: selectedIndex == index
                                              ? Colors.white
                                              : Colors.black,
                                          backgroundColor:
                                              selectedIndex == index
                                                  ? Colors.black
                                                  : AppColors.buttonBackground,
                                          borderColor: selectedIndex == index
                                              ? Colors.black
                                              : AppColors.buttonBackground,
                                          text: (index + 1).toString(),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 200,
                              ),
                              AppLargeText(
                                text: "Description",
                                color: Colors.black.withOpacity(0.8),
                                size: 20,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              AppText(
                                text: detail.place.description,
                                color: AppColors.mainTextColor,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (firstTime) {
                                          heart = state.favorite.placeid != 0;
                                        }

                                        if (firstTime) {
                                          firstTime = false;
                                        }

                                        if (heart == false) {
                                          heart = true;
                                          data.postFav(state.user.user_id,
                                              state.place.id, true);
                                        } else {
                                          heart = false;
                                          data.postFav(state.user.user_id,
                                              state.place.id, false);
                                        }
                                      });
                                    },
                                    child: AppButtons(
                                      color: firstTime
                                          ? detail.favorite.placeid != 0
                                              ? Colors.red
                                              : Colors.grey.withOpacity(0.8)
                                          : heart
                                              ? Colors.red
                                              : Colors.grey.withOpacity(0.8),
                                      backgroundColor: Colors.white,
                                      size: 60,
                                      borderColor: AppColors.textColor2,
                                      isIcon: true,
                                      icon: Icons.favorite,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  ResponsiveButton(
                                    goesWeb: true,
                                    isResponsive: true,
                                    cityName: detail.place.name,
                                    people: selectedIndex == -1
                                        ? 2
                                        : selectedIndex + 1,
                                    checkin: DateTime(2023, 5, 5),
                                    checkout: DateTime(2023, 5, 10),
                                  ),
                                ],
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
          ),
        );
      },
    );
  }
}

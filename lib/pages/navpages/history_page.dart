import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/widgets/app_text.dart';

import '../../cubit/app_cubit.dart';
import '../../cubit/app_cubit_states.dart';
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
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is LoadedState) {
            // ignore: unused_local_variable
            var info = state.places;
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
                        AppLargeText(text: "History"),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                            child: ListView.builder(
                          itemCount: info.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: GestureDetector(
                              onTap: () {
                                BlocProvider.of<AppCubits>(context)
                                    .detailPage(info[index]);
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    height: 80,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fitWidth,
                                          image: NetworkImage(
                                              info[index].imageUrl)),
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
                                        color: Colors.white.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: AppText(
                                              text: info[index].name,
                                              size: 21,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              AppText(
                                                text: info[index].location,
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
                        ))
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
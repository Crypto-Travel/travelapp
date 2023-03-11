import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/pages/home_page2.dart';
import 'package:travelapp/pages/navpages/main_page.dart';
import 'package:travelapp/pages/welcomeScreen.dart';

import '../pages/detail_page.dart';
import 'app_cubit.dart';
import 'app_cubit_states.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return const MainPage(); //da cambiare con intro page
          }
          if (state is DetailState) {
            return const IntroPage(); //da cambiare con la detail page
          }
          if (state is LoadedState) {
            return const MainPage();
          }
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            ); //caricamento
          }
          if (state is GabboState) {
            return const DetailPage(); //da cambiare con detail page ma comunque momentao per gabbo
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

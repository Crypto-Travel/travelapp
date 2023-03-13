import 'package:bloc/bloc.dart';

import '../model/data_model.dart';
import '../pages/Services/data_service.dart';
import 'app_cubit_states.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;

  Future<void> getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {}
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(WelcomeState()); //da cambiare con LoadedState(places)
  }

  //momentanea per gabbo
  goDetail() {
    emit(GabboState());
  }
}

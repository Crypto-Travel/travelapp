import 'package:bloc/bloc.dart';

import '../model/data_model.dart';
import '../model/history_model.dart';
import '../model/user_model.dart';
import '../pages/Services/data_service.dart';
import 'app_cubit_states.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  // ignore: prefer_typing_uninitialized_variables
  late List<DataModel> places;
  late UserModel user;
  late List<HistoryModel> history;

  Future<void> getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      user = await data.getId();
      emit(LoadedState(places, user));
      // ignore: empty_catches
    } catch (e) {}
  }

  Future<void> getHistoryData() async {
    try {
      history = await data.getHistoryInfo(user.user_id);
      emit(HistoryLoaded(user, history, places));
      // ignore: empty_catches
    } catch (e) {
      print(e);
    }
  }

  detailPage(DataModel data, UserModel user) {
    emit(DetailState(data, user));
  }

  goHome() {
    emit(LoadedState(places, user));
  }
}

import 'package:equatable/equatable.dart';
import 'package:travelapp/model/history_model.dart';

import '../model/data_model.dart';
import '../model/user_model.dart';

abstract class CubitStates extends Equatable {
  get places => null;

  get user => null;
}

class InitialState extends CubitStates {
  @override
  List<Object> get props => [/*data to change*/];
}

class WelcomeState extends CubitStates {
  @override
  List<Object> get props => [];
}

class LoadingState extends CubitStates {
  @override
  List<Object> get props => [];
}

class LoadedState extends CubitStates {
  LoadedState(this.places, this.user);
  @override
  final List<DataModel> places;
  @override
  final UserModel user;
  @override
  List<Object> get props => [places, user];
}

class HistoryLoaded extends CubitStates {
  HistoryLoaded(this.user, this.history, this.places);
  @override
  final List<DataModel> places;
  @override
  final UserModel user;
  final List<HistoryModel> history;
  @override
  List<Object> get props => [user, history, places];
}

class DetailState extends CubitStates {
  DetailState(this.place, this.user);
  final DataModel place;
  @override
  final UserModel user;
  @override
  List<Object> get props => [place, user];
}

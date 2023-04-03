import 'package:equatable/equatable.dart';
import 'package:travelapp/model/favorite_model.dart';
import 'package:travelapp/model/history_model.dart';

import '../model/data_model.dart';
import '../model/user_model.dart';

abstract class CubitStates extends Equatable {
  get places => null;

  get user => null;

  get history => null;

  get favorites => null;
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
  LoadedState(this.places, this.user, this.history, this.favorites);
  @override
  final List<DataModel> places;
  @override
  final UserModel user;
  @override
  final List<HistoryModel> history;
  @override
  final List<FavoriteModel> favorites;
  @override
  List<Object> get props => [places, user, history, favorites];
}

// class HistoryLoaded extends CubitStates {
//   HistoryLoaded(this.user, this.history, this.places);
//   @override
//   final List<DataModel> places;
//   @override
//   final UserModel user;
//   @override
//   final List<HistoryModel> history;
//   @override
//   List<Object> get props => [user, history, places];
// }

class DetailState extends CubitStates {
  DetailState(this.place, this.user, this.favorite);
  final DataModel place;
  @override
  final UserModel user;
  final FavoriteModel favorite;
  @override
  List<Object> get props => [place, user, favorite];
}

class ActivityState extends CubitStates {
  ActivityState(this.activities, this.user, this.activityName, this.favorites);
  final List<DataModel> activities;
  @override
  final UserModel user;
  final List<FavoriteModel> favorites;
  final String activityName;
  @override
  List<Object> get props => [activities, user, activityName, favorites];
}

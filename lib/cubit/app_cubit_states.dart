import 'package:equatable/equatable.dart';

import '../model/data_model.dart';
import '../model/user_model.dart';

abstract class CubitStates extends Equatable {}

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
  final List<DataModel> places;
  final UserModel user;
  @override
  List<Object> get props => [places, user];
}

class DetailState extends CubitStates {
  DetailState(this.places, this.user);
  final DataModel places;
  final UserModel user;
  @override
  List<Object> get props => [places, user];
}

import 'package:equatable/equatable.dart';

import '../model/data_model.dart';

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
  LoadedState(this.places);
  final List<DataModel> places;
  @override
  List<Object> get props => [places];
}

class DetailState extends CubitStates {
  DetailState(this.places);
  final DataModel places;
  @override
  List<Object> get props => [places];
}

//momentaneo for gabbo
class GabboState extends CubitStates {
  @override
  List<Object> get props => [];
}

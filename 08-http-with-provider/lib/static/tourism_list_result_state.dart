// todo-init-01: create a sealed class to make a state
import 'package:tourism_app/data/model/tourism.dart';

sealed class TourismListResultState {}

// todo-init-02: expand the result for none, loading, loaded, and error state
class TourismListNoneState extends TourismListResultState {}

class TourismListLoadingState extends TourismListResultState {}

class TourismListErrorState extends TourismListResultState {
  final String error;

  TourismListErrorState(this.error);
}

class TourismListLoadedState extends TourismListResultState {
  final List<Tourism> data;

  TourismListLoadedState(this.data);
}

// todo-detail-01: create a sealed class to make a state
import 'package:tourism_app/data/model/tourism.dart';

sealed class TourismDetailResultState {}

// todo-detail-02: expand the result for non, loading, loaded, and error state
class TourismDetailNoneState extends TourismDetailResultState {}

class TourismDetailLoadingState extends TourismDetailResultState {}

class TourismDetailErrorState extends TourismDetailResultState {
  final String error;

  TourismDetailErrorState(this.error);
}

class TourismDetailLoadedState extends TourismDetailResultState {
  final Tourism data;

  TourismDetailLoadedState(this.data);
}

import 'package:tourism_app/data/model/tourism.dart';

sealed class TourismDetailResultState {}

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

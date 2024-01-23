// todo-home-01: create a tourism list provider that contain a result state
import 'package:flutter/widgets.dart';
import 'package:tourism_app/data/api/api_services.dart';

import 'package:tourism_app/static/tourism_list_result_state.dart';

class TourismListProvider extends ChangeNotifier {
  // todo-home-02: inject an ApiService to maintain more easily
  final ApiServices _apiServices;

  TourismListProvider(
    this._apiServices,
  );

  // todo-home-03: add result state to maintain the state and get method
  TourismListResultState _resultState = TourismListNoneState();

  TourismListResultState get resultState => _resultState;

  // todo-home-04: create a function to load the list
  Future<void> fetchTourismList() async {
    // todo-home-05: add a try-catch to maintain error
    try {
      // todo-home-06: first, initialize the loading state, dont forget to notify it
      _resultState = TourismListLoadingState();
      notifyListeners();

      // todo-home-07: second, run the api service
      final result = await _apiServices.getTourismList();

      if (result.error) {
        _resultState = TourismListErrorState(result.message);
        notifyListeners();
      } else {
        _resultState = TourismListLoadedState(result.places);
        notifyListeners();
      }
    } on Exception catch (e) {
      // todo-home-08: then, notify the widget when it's error
      _resultState = TourismListErrorState(e.toString());
      notifyListeners();
    }
  }
}

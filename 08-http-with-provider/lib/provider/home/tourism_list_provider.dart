// todo-02-home-01: create a tourism list provider that contain a result state
import 'package:flutter/widgets.dart';
import 'package:tourism_app/data/api/api_services.dart';

import 'package:tourism_app/static/tourism_list_result_state.dart';

class TourismListProvider extends ChangeNotifier {
  // todo-02-home-02: inject an ApiService to maintain more easily
  final ApiServices _apiServices;

  TourismListProvider(
    this._apiServices,
  );

  // todo-02-home-03: add result state to maintain the state and get method
  TourismListResultState _resultState = TourismListNoneState();

  TourismListResultState get resultState => _resultState;

  // todo-02-home-04: create a function to load the list
  Future<void> fetchTourismList() async {
    // todo-02-home-05: add a try-catch to maintain error
    try {
      // todo-02-home-06: first, initialize the loading state, dont forget to notify it
      _resultState = TourismListLoadingState();
      notifyListeners();

      // todo-02-home-07: second, run the api service
      final result = await _apiServices.getTourismList();

      if (result.error) {
        _resultState = TourismListErrorState(result.message);
        notifyListeners();
      } else {
        _resultState = TourismListLoadedState(result.places);
        notifyListeners();
      }
    } on Exception catch (e) {
      // todo-02-home-08: then, notify the widget when it's error
      _resultState = TourismListErrorState(e.toString());
      notifyListeners();
    }
  }
}

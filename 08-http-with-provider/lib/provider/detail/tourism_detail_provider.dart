// todo-03-detail-01: create a new provider to handle a detail api
import 'package:flutter/widgets.dart';
import 'package:tourism_app/data/api/api_services.dart';
import 'package:tourism_app/static/tourism_detail_result_state.dart';

class TourismDetailProvider extends ChangeNotifier {
  // todo-03-detail-02: inject an ApiService to maintain more easily
  final ApiServices _apiServices;

  TourismDetailProvider(
    this._apiServices,
  );

  // todo-03-detail-03: add a variable state and get method
  TourismDetailResultState _resultState = TourismDetailNoneState();

  TourismDetailResultState get resultState => _resultState;

  // todo-03-detail-04: create a function to load a detail page
  Future<void> fetchTourismDetail(int id) async {
    try {
      _resultState = TourismDetailLoadingState();
      notifyListeners();

      final result = await _apiServices.getTourismDetail(id);

      if (result.error) {
        _resultState = TourismDetailErrorState(result.message);
        notifyListeners();
      } else {
        _resultState = TourismDetailLoadedState(result.place);
        notifyListeners();
      }
    } on Exception catch (e) {
      _resultState = TourismDetailErrorState(e.toString());
      notifyListeners();
    }
  }
}

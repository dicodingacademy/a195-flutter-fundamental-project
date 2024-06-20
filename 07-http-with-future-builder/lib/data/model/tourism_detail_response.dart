// todo-04-detail-01: create a class for api response
import 'package:tourism_app/data/model/tourism.dart';

class TourismDetailResponse {
  final bool error;
  final String message;
  final Tourism place;

  TourismDetailResponse({
    required this.error,
    required this.message,
    required this.place,
  });

  // todo-04-detail-02: dont forget to add map converter
  factory TourismDetailResponse.fromJson(Map<String, dynamic> json) {
    return TourismDetailResponse(
      error: json["error"],
      message: json["message"],
      place: Tourism.fromJson(json["place"]),
    );
  }
}

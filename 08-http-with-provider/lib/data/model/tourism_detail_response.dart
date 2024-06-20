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

  factory TourismDetailResponse.fromJson(Map<String, dynamic> json) {
    return TourismDetailResponse(
      error: json["error"],
      message: json["message"],
      place: Tourism.fromJson(json["place"]),
    );
  }
}

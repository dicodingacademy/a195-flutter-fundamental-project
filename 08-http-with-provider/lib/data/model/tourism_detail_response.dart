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
    return switch (json) {
      {
        "error": bool error,
        "message": String message,
        "place": Map<String, dynamic> place,
      } =>
        TourismDetailResponse(
          error: error,
          message: message,
          place: Tourism.fromJson(place),
        ),
      _ => throw const FormatException(
          'Failed to load tourism detail response data.'),
    };
  }
}

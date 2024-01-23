import 'package:tourism_app/data/model/tourism.dart';

class TourismListResponse {
  final bool error;
  final String message;
  final int count;
  final List<Tourism> places;

  TourismListResponse({
    required this.error,
    required this.message,
    required this.count,
    required this.places,
  });

  factory TourismListResponse.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "error": bool error,
        "message": String message,
        "count": int count,
        "places": List<dynamic>? places,
      } =>
        TourismListResponse(
          error: error,
          message: message,
          count: count,
          places: places != null
              ? places
                  .map(
                    (placeData) =>
                        Tourism.fromJson(placeData as Map<String, dynamic>),
                  )
                  .toList()
              : <Tourism>[],
        ),
      _ => throw const FormatException(
          'Failed to load tourism list response data.'),
    };
  }
}

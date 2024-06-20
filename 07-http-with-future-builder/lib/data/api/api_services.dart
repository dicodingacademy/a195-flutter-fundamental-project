// todo-02-api-02: restructure this folder
// todo-02-api-03: create a folder for API services
import 'dart:convert';

import 'package:tourism_app/data/model/tourism_detail_response.dart';
import 'package:tourism_app/data/model/tourism_list_response.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  // todo-02-api-04: add base url for api
  static const String _baseUrl = "https://tourism-api.dicoding.dev";

  // todo-02-api-05: create an end-point to get a list of tourism
  Future<TourismListResponse> getTourismList() async {
    final response = await http.get(Uri.parse("$_baseUrl/list"));

    if (response.statusCode == 200) {
      return TourismListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load tourism list');
    }
  }

  // todo-04-detail-03: add end-point to get a detail of tourism place
  Future<TourismDetailResponse> getTourismDetail(int id) async {
    final response = await http.get(Uri.parse("$_baseUrl/detail/$id"));

    if (response.statusCode == 200) {
      return TourismDetailResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load tourism detail');
    }
  }
}

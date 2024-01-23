import 'dart:convert';

import 'package:tourism_app/data/model/tourism_detail_response.dart';
import 'package:tourism_app/data/model/tourism_list_response.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String _baseUrl = "https://tourism-api.dicoding.dev";

  Future<TourismListResponse> getTourismList() async {
    final response = await http.get(Uri.parse("$_baseUrl/list"));

    if (response.statusCode == 200) {
      return TourismListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load tourism list');
    }
  }

  // Future<TourismDetailResponse> getTourismDetail(int id) async {
  //   final response = await http.get(Uri.parse("$_baseUrl/detail/$id"));

  //   if (response.statusCode == 200) {
  //     return TourismDetailResponse.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to load tourism detail');
  //   }
  // }

  Future<TourismDetailResponse> getTourismDetail(int id) async {
    return Future<TourismDetailResponse>.delayed(
      const Duration(seconds: 1),
      () {
        const body = """
        {
          "error":false,
          "message":"success",
          "place": {
            "id":1,
            "name":"TN Kelimutu",
            "description":"Taman Nasional Kelimutu terletak di Flores, Indonesia. Taman nasional ini terdiri dari bukit-bukit dan gunung-gunung dengan Gunung Kelibara (1.731 m) sebagai puncak tertinggi. Gunung Kelimutu, terdapat danau Danau tiga warna yang juga merupakan tempat dari Taman Nasional Kelimutu. Di dalam Taman Nasional Kelimutu, terdapat arboretum, hutan kecil seluas 4,5 hektare yang mewakili koleksi keanekaragaman flora di daerah tersebut. Di sana terdapat 78 jenis pohon yang dikelompokkan ke dalam 36 suku. Beberapa koleksi flora yang merupakan endemik Kelimutu adalah uta onga (Begonia kelimutuensis), turuwara (Rhododendron renschianum), dan arngoni (Vaccinium varingiaefolium).",
            "address":"Detusoko, Kabupaten Ende, NTT",
            "longitude":121.791432,
            "latitude":-8.7415482,
            "like":57,
            "image":"https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Kelimutu_2008-08-08.jpg/800px-Kelimutu_2008-08-08.jpg"
          }
        }
        """;
        return TourismDetailResponse.fromJson(jsonDecode(body));
      },
    );
  }
}

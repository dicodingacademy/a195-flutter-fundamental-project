import 'dart:async';

import 'package:dicoding_news_app/data/api/api_service.dart';
import 'package:dicoding_news_app/data/model/articles.dart';
import 'package:flutter/material.dart';

class NewsProvider extends ChangeNotifier {
  final _apiService = ApiService();
  final _streamController = StreamController<ArticlesResult>();

  Stream<ArticlesResult> get catPhotoStream => _streamController.stream;

  fetchAllArticle(String mealsType) async {
    final article = await _apiService.topHeadlines();
    _streamController.sink.add(article);
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}

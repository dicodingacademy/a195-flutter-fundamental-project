import 'dart:async';

import 'package:dicoding_news_app/data/api/api_service.dart';
import 'package:dicoding_news_app/data/model/articles.dart';
import 'package:flutter/material.dart';

class NewsProvider extends ChangeNotifier {
  final ApiService apiService;

  NewsProvider({@required this.apiService}) {
    _fetchAllArticle();
  }

  bool _isLoading = false;
  bool _isEmpty = false;
  bool _isError = false;
  String _message = '';
  ArticlesResult _articlesResult;

  bool get isLoading => _isLoading;

  bool get isEmpty => _isEmpty;

  bool get isError => _isError;

  String get message => _message;

  ArticlesResult get result => _articlesResult;

  Future<dynamic> _fetchAllArticle() async {
    try {
      _isLoading = true;
      _isEmpty = false;
      _isError = false;
      notifyListeners();
      final article = await apiService.topHeadlines();
      if (article.articles.isEmpty) {
        _isLoading = false;
        _isError = false;
        _isEmpty = true;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _isLoading = false;
        _isError = false;
        _isEmpty = false;
        notifyListeners();
        return _articlesResult = article;
      }
    } catch (e) {
      _isLoading = false;
      _isError = true;
      _isEmpty = false;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}

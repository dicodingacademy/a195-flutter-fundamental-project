import 'package:dicoding_news_app/data/api/api_service.dart';
import 'package:flutter/cupertino.dart';

enum NotificationState { Success, Error }

class NotificationProvider extends ChangeNotifier {
  final ApiService apiService;

  NotificationProvider({@required this.apiService}) {
    _getNotification();
  }

  String _message = '';
  NotificationState _state;
  dynamic _data;

  String get message => _message;

  NotificationState get state => _state;

  dynamic get data => _data;

  Future<dynamic> _getNotification() async {
    try {
      _state = NotificationState.Success;
      notifyListeners();
      var data = await apiService.newsNotification();
      return _data = data;
    } catch (e) {
      _state = NotificationState.Error;
      notifyListeners();
      return _message = 'Notification Error --> $e';
    }
  }
}

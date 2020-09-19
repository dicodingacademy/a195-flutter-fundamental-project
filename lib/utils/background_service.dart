import 'dart:isolate';
import 'dart:ui';

import 'package:dicoding_news_app/data/api/api_service.dart';

import '../main.dart';
import 'notification_helper.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static String _isolateName = 'isolate';
  static SendPort _uiSendPort;

  static void initializeIsolate() {
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      _isolateName,
    );
  }

  static Future<void> callback() async {
    print('Alarm fired!');

    var result = await ApiService().topHeadlines();
    await NotificationHelper.showNotification(
        flutterLocalNotificationsPlugin, result);

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }

  static Future<void> someTask() async {
    print('Execute some process');
  }
}

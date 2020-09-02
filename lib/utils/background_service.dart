import 'dart:isolate';
import 'dart:ui';

import 'package:dicoding_news_app/data/api/api_service.dart';

import '../main.dart';
import 'notification_helper.dart';

/// Nama yang terkait dengan isolate UI [SendPort].
const String isolateName = 'isolate';

/// Port yang digunakan untuk berkomunikasi dari background isolate ke UI isolate
final ReceivePort port = ReceivePort();

class BackgroundService {
  // Background
  static SendPort uiSendPort;

  static void initializeIsolate() {
    // Daftarkan SendPort isolasi UI untuk memungkinkan komunikasi dari isolat background.
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      isolateName,
    );
  }

  // Ketika aplikasi sedang dibuka, diminimalkan, dan ditutup, maka fungsi ini
  // akan tetap berjalan.

  // Callback untuk proses dari alarm
  static Future<void> callback() async {
    print('Alarm fired!');

    var result = await ApiService().topHeadlines();
    var article = result.articles[0];
    await NotificationHelper.showNotification(
        flutterLocalNotificationsPlugin, article);

    // Ini akan menjadi nol jika kita berjalan di latar belakang.
    uiSendPort ??= IsolateNameServer.lookupPortByName(isolateName);
    uiSendPort?.send(null);
  }

  // Ketika aplikasi sedang dibuka, dan diminimalkan, maka fungsi ini akan
  // tetap berjalan.
  // Tetapi ketika aplikasi sedang ditutup, maka fungsi ini tidak akan di berjalan.
  static Future<void> someTask() async {
    // Pastikan kita telah memuat pembaruan dari background isolate.
    print('Execute some process');
  }
}

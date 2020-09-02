import 'package:dicoding_news_app/data/model/articles.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Stream dibuat agar aplikasi dapat merespons peristiwa terkait pemberitahuan sejak plugin diinisialisasi dalam fungsi `main`
final selectNotificationSubject = BehaviorSubject<String>();

class NotificationHelper {
  static Future<void> initNotifications(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String payload) async {
      if (payload != null) {
        print('notification payload: ' + payload);
      }
      selectNotificationSubject.add(payload);
    });
  }

  // Fungsi untuk menampilkan notifikasi
  static Future<void> showNotification(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
      Articles articles) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High, ticker: 'ticker');

    var iOSPlatformChannelSpecifics = IOSNotificationDetails();

    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, articles.title, articles.description, platformChannelSpecifics,
        payload: 'plain notification');
  }

  // Fungsi untuk mengatasi proses klik pada notifikasi dan mengarahkannya
  // ke halaman tertentu dengan data atau tanpa data
  static void configureSelectNotificationSubject(
      BuildContext context, String route) {
    selectNotificationSubject.stream.listen((String payload) async {
//      await Navigator.pushNamed(context, route, arguments: BundleData(payload));
    });
  }
}

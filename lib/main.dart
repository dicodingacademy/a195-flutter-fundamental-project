import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:dicoding_news_app/common/styles.dart';
import 'package:dicoding_news_app/data/api/api_service.dart';
import 'package:dicoding_news_app/provider/news_provider.dart';
import 'package:dicoding_news_app/ui/detail_page.dart';
import 'package:dicoding_news_app/ui/home_page.dart';
import 'package:dicoding_news_app/ui/setting_page.dart';
import 'package:dicoding_news_app/utils/background_service.dart';
import 'package:dicoding_news_app/utils/notification_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  // Jika terdapat sebuah fungsi yang akan dijalankan di dalam 'main', pastikan
  // selalu tambahkan fungsi ini
  WidgetsFlutterBinding.ensureInitialized();

  // Melakukan inisiasi untuk melakukan proses background service dan notifikasi
  BackgroundService.initializeIsolate();
  await AndroidAlarmManager.initialize();
  await NotificationHelper.initNotifications(flutterLocalNotificationsPlugin);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const title = 'News App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: myTextTheme,
        appBarTheme: AppBarTheme(
          textTheme: myTextTheme.apply(bodyColor: Colors.black),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.white70,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
        ),
      ),
      // When using home, don’t define a initialRoute property.
      home: ChangeNotifierProvider<NewsProvider>(
        create: (_) => NewsProvider(apiService: ApiService()),
        child: HomePage(title: title),
      ),
      routes: {
        DetailPage.routeName: (context) => DetailPage(),
        SettingPage.route: (context) => SettingPage(),
      },
    );
  }
}

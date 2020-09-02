import 'dart:math';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:dicoding_news_app/ui/detail_page.dart';
import 'package:dicoding_news_app/utils/background_service.dart';
import 'package:dicoding_news_app/utils/notification_helper.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  static const route = "/setting_page";

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  void initState() {
    super.initState();

    // Mendaftarkan event dari background isolate dan kemudian pesan akan selalu
    // datang bertepatan dengan penekanan proses dari alarm.
    port.listen((_) async => await BackgroundService.someTask());

    NotificationHelper.configureSelectNotificationSubject(
        context, DetailPage.routeName);
  }

  @override
  void dispose() {
    selectNotificationSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: RaisedButton(
          child: Text('Scheduled News'),
          onPressed: () async {
            print('Scheduled clicked');
            await AndroidAlarmManager.oneShotAt(
              DateTime.now().add(Duration(seconds: 10)),
              Random().nextInt(pow(2, 31)), // Pastikan kita memilikin ID alarm yang unik.
              BackgroundService.callback,
              exact: true,
              wakeup: true,
            );
          },
        ),
      ),
    );
  }
}

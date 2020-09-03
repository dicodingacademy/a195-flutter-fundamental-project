import 'dart:math';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:dicoding_news_app/provider/notification_provider.dart';
import 'package:dicoding_news_app/utils/background_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  static const route = "/setting_page";

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<NotificationProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Scheduled News'),
          onPressed: () async {
            print('Scheduled clicked');
            print('This data is success --> ${state.data}');
            await AndroidAlarmManager.oneShotAt(
              DateTime.now().add(Duration(seconds: 5)),
              Random().nextInt(pow(2, 31)),
              // Pastikan kita memilikin ID alarm yang unik.
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

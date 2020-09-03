import 'dart:math';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:dicoding_news_app/utils/background_service.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  static const route = "/setting_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Scheduled News'),
          onPressed: () async {
            print('Scheduled clicked');
            await AndroidAlarmManager.oneShotAt(
              DateTime.now().add(Duration(seconds: 5)),
              Random().nextInt(pow(2, 31)),
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

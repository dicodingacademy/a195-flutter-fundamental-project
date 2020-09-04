import 'package:dicoding_news_app/provider/scheduling_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  static const route = "/setting_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Scheduling News',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Deactivate',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Consumer<SchedulingProvider>(
                  builder: (context, scheduled, _) {
                    return Switch(
                      value: scheduled.isScheduled,
                      onChanged: (value) async {
                        scheduled.scheduledNews(value);
                      },
                    );
                  },
                ),
                Text(
                  'Activate',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

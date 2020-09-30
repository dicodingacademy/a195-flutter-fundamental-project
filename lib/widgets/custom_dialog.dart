import 'dart:io';
import 'package:dicoding_news_app/common/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

customDialog(BuildContext context) {
  if (Platform.isIOS) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('Coming Soon!'),
          content: Text('This feature will be coming soon!'),
          actions: [
            CupertinoDialogAction(
              child: Text('Ok'),
              onPressed: () {
                Navigation.back();
              },
            ),
          ],
        );
      },
    );
  } else {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Coming Soon!'),
          content: Text('This feature will be coming soon!'),
          actions: [
            FlatButton(
              onPressed: () {
                Navigation.back();
              },
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}

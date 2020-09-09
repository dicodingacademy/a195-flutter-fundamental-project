import 'package:dicoding_news_app/ui/article_list_page.dart';
import 'package:dicoding_news_app/ui/settings_page.dart';
import 'package:dicoding_news_app/widgets/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;
  final String _headlineText = 'Headline';

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: _bottomNavIndex == 0 ? ArticleListPage() : SettingsPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            title: Text(_headlineText),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text(SettingsPage.settingsTitle),
          ),
        ],
        onTap: (selected) {
          setState(() {
            _bottomNavIndex = selected;
          });
        },
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.news),
            title: Text(_headlineText),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            title: Text(SettingsPage.settingsTitle),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return ArticleListPage();
          case 1:
            return SettingsPage();
          default:
            return null;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}

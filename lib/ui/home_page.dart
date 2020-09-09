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
  static const String _headlineText = 'Headline';

  List<Widget> _listWidget = [
    ArticleListPage(),
    SettingsPage(),
  ];

  List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.public),
      title: Text(_headlineText),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      title: Text(SettingsPage.settingsTitle),
    ),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: _onBottomNavTapped,
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: _bottomNavBarItems,
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

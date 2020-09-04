import 'package:dicoding_news_app/article.dart';
import 'package:dicoding_news_app/detail_page.dart';
import 'package:dicoding_news_app/settings_page.dart';
import 'package:dicoding_news_app/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsListPage extends StatefulWidget {
  static const routeName = '/article_list';

  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  int bottomNavIndex = 0;

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: bottomNavIndex == 0
          ? Scaffold(
              appBar: AppBar(
                title: Text('News App'),
              ),
              body: ArticleList(),
            )
          : SettingsPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            title: Text('Headline'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
        onTap: (selected) {
          setState(() {
            bottomNavIndex = selected;
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
            title: Text('Headline'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('News App'),
              ),
              child: ArticleList(),
            );
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

class ArticleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildArticleItem(BuildContext context, Article article) {
      return Material(
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          leading: Hero(
            tag: article.urlToImage,
            child: Image.network(
              article.urlToImage,
              width: 100,
            ),
          ),
          title: Text(
            article.title,
          ),
          subtitle: Text(article.author),
          onTap: () {
            Navigator.pushNamed(context, ArticleDetailPage.routeName,
                arguments: article);
          },
        ),
      );
    }

    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context).loadString('assets/articles.json'),
      builder: (context, snapshot) {
        final List<Article> articles = parseArticles(snapshot.data);
        return ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return _buildArticleItem(context, articles[index]);
          },
        );
      },
    );
  }
}

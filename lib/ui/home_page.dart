import 'package:dicoding_news_app/provider/news_provider.dart';
import 'package:dicoding_news_app/ui/detail_page.dart';
import 'package:dicoding_news_app/widget/card_article.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<NewsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: _buildBody(state),
      ),
    );
  }

  Widget _buildBody(NewsProvider state) {
    if (state.isLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (state.result != null) {
      return ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.black,
        ),
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: state.result.articles.length,
        itemBuilder: (context, index) {
          var article = state.result.articles[index];
          return CardArticle(
            image: article.urlToImage,
            title: article.title,
            desc: article.description,
            onPressed: () => Navigator.pushNamed(
              context,
              DetailPage.routeName,
              arguments: BundleData(article.source, article),
            ),
          );
        },
      );
    } else if (state.isEmpty) {
      return Center(child: Text(state.message));
    } else if (state.isError) {
      return Center(child: Text(state.message));
    } else {
      return Center(child: Text(''));
    }
  }
}

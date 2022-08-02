import 'dart:convert';

class Article {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> article) => Article(
        author: article['author'],
        title: article['title'],
        description: article['description'],
        url: article['url'],
        urlToImage: article['urlToImage'],
        publishedAt: article['publishedAt'],
        content: article['content'],
      );
}

List<Article> parseArticles(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json);
  return parsed.map((json) => Article.fromJson(json)).toList();
}

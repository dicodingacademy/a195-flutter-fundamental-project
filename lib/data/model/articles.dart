class ArticlesResult {
  ArticlesResult({
    this.status,
    this.totalResults,
    this.articles,
  });

  String status;
  int totalResults;
  List<Articles> articles;

  factory ArticlesResult.fromJson(Map<String, dynamic> json) => ArticlesResult(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<Articles>.from(
        json["articles"].map((x) => Articles.fromJson(x))),
  );
}

class Articles {
  Articles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
    source: Source.fromJson(json["source"]),
    author: json["author"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    publishedAt: json["publishedAt"],
    content: json["content"] == null ? null : json["content"],
  );
}

class Source {
  Source({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: json["id"],
    name: json["name"],
  );
}

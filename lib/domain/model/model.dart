class Data{
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;
  String publishedAt;

  Data(this.author, this.title, this.description, this.url, this.urlToImage, this.content, this.publishedAt);
}

class NewsData{
  List<Data> data;

  NewsData(this.data);
}



class News{
  NewsData newsData;

  News(this.newsData);
}
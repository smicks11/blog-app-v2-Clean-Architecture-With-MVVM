import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';


@JsonSerializable()
class BaseResponse{
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "totalResults")
  int? totalResults;
}

@JsonSerializable()
class DataResposne{
  @JsonKey(name: "author")
  String? author;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "urlToImage")
  String? urlToImage;
  @JsonKey(name: "content")
  String? content;
  @JsonKey(name: "publishedAt")
  String? publishedAt;

  DataResposne(this.author, this.title, this.description, this.url, this.urlToImage, this.content, this.publishedAt);

  //from json
  factory DataResposne.fromJson(Map<String, dynamic> json) => _$DataResposneFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$DataResposneToJson(this);
}

@JsonSerializable()
class HomeDataResponse{
  @JsonKey(name: "articles")
  List<DataResposne>? articles;

  HomeDataResponse(this.articles);

  //from json
  factory HomeDataResponse.fromJson(Map<String, dynamic> json) => _$HomeDataResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$HomeDataResponseToJson(this);
}

@JsonSerializable()
class NewsResponse extends BaseResponse{
  @JsonKey(name: "data")
  HomeDataResponse dataResposne;

  NewsResponse(this.dataResposne);

  //from json
  factory NewsResponse.fromJson(Map<String, dynamic> json) => _$NewsResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) {
  return BaseResponse()..status = json['status'] as String?;
}

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
    };

DataResposne _$DataResposneFromJson(Map<String, dynamic> json) {
  return DataResposne(
    json['author'] as String?,
    json['title'] as String?,
    json['description'] as String?,
    json['url'] as String?,
    json['urlToImage'] as String?,
    json['content'] as String?,
    json['publishedAt'] as String?,
  );
}

Map<String, dynamic> _$DataResposneToJson(DataResposne instance) =>
    <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'content': instance.content,
      'publishedAt': instance.publishedAt,
    };

HomeDataResponse _$HomeDataResponseFromJson(Map<String, dynamic> json) {
  return HomeDataResponse(
    (json['articles'] as List<dynamic>?)
        ?.map((e) => DataResposne.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$HomeDataResponseToJson(HomeDataResponse instance) =>
    <String, dynamic>{
      'articles': instance.articles,
    };

NewsResponse _$NewsResponseFromJson(Map<String, dynamic> json) {
  return NewsResponse(
    HomeDataResponse.fromJson(json),
  )..status = json['status'] as String?;
}

Map<String, dynamic> _$NewsResponseToJson(NewsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.dataResposne,
    };

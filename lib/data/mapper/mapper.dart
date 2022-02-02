//Here is the mapper that converts the response from the endpoints to non nullable object (model)

import 'package:blog_app_v2/app/extension.dart';
import 'package:blog_app_v2/data/response/responses.dart';
import 'package:blog_app_v2/domain/model/model.dart';

extension DataResponseMapper on DataResposne? {
  Data toDomain(){
    return Data(
      this?.author?.orEmpty() ?? EMPTY,  
       this?.title?.orEmpty() ?? EMPTY, 
       this?.description?.orEmpty() ?? EMPTY,
       this?.url?.orEmpty() ?? EMPTY,
       this?.urlToImage?.orEmpty() ?? EMPTY,
       this?.content?.orEmpty() ?? EMPTY,
       this?.publishedAt?.orEmpty() ?? EMPTY,
    );
  }
}

extension NewsResponseMapper on NewsResponse?{
  News toDomain(){
    List<Data> mappedData = (this?.dataResposne.articles?.map((articles) => articles.toDomain()) ?? Iterable.empty())
        .cast<Data>()
        .toList();
    
    var data = NewsData(mappedData);
    return News(data);
  }
}
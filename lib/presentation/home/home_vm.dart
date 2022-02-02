import 'dart:async';
import 'dart:ffi';

import 'package:blog_app_v2/domain/model/model.dart';
import 'package:blog_app_v2/domain/usecase/get_news_usecase.dart';
import 'package:blog_app_v2/presentation/base/base_viewmodel.dart';

class HomeViewModel extends BaseViewModel with HomeViewModelInput, HomeViewModelOutputs{
  GetNewsUseCase _getNewsUseCase;

  HomeViewModel(this._getNewsUseCase);

  final StreamController _dataStreamController = StreamController<NewsViewObject>.broadcast();
  
  @override
  void dispose() {
    _dataStreamController.close();
  }

  @override
  
  Sink get inputState => throw UnimplementedError();

  @override
  
  Stream get outputState => throw UnimplementedError();

  @override
  void start() {
    _getNews();    
  }

  //private functions
  _getNews() async{
    (await _getNewsUseCase.execute(Void)).fold((l) => null, (newsObject) {
      inputHomeData.add(NewsViewObject(newsObject.newsData.data));
    });
  }

  

  @override
  
  Stream<NewsViewObject> get outputHomeData => _dataStreamController.stream.map((data) => data);

  @override
  
  Sink get inputHomeData => _dataStreamController.sink;

}




abstract class HomeViewModelInput{
  Sink get inputHomeData;
}

abstract class HomeViewModelOutputs{
  Stream<NewsViewObject> get outputHomeData;
}

class NewsViewObject{
  List<Data> data;

  NewsViewObject(this.data);
}
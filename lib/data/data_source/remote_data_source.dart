import 'package:blog_app_v2/data/network/app_api.dart';
import 'package:blog_app_v2/data/response/responses.dart';

abstract class RemoteDataSource{
  Future<NewsResponse> getNews();
}


class RemoteDataSourceImplementer implements RemoteDataSource{
  AppServiceClient _appServiceClient;
  RemoteDataSourceImplementer(this._appServiceClient);
  @override
  Future<NewsResponse> getNews() async{
    return await _appServiceClient.getNews();
  }
}
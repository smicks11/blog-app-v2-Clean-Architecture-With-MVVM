
import 'package:blog_app_v2/app/constants.dart';
import 'package:blog_app_v2/data/response/responses.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient{
 factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

 @GET("/v2/top-headlines?country=us&category=business&apiKey=640f7435fec643d6abdd8eb6de375859")
 Future<NewsResponse> getNews();

}


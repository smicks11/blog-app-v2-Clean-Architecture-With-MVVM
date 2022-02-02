import 'package:blog_app_v2/data/data_source/remote_data_source.dart';
import 'package:blog_app_v2/data/network/error_handler.dart';
import 'package:blog_app_v2/data/network/network_info.dart';
import 'package:blog_app_v2/domain/model/model.dart';
import 'package:blog_app_v2/data/network/failure.dart';
import 'package:blog_app_v2/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:blog_app_v2/data/mapper/mapper.dart';

class RepositoryImpl implements Repository{
  RemoteDataSource _remoteDataSource;
  NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);
  @override
  Future<Either<Failure, News>> getNews() async{
    if(await _networkInfo.isConnected){
      final response = await _remoteDataSource.getNews();
      print(response);
      try {
        final response = await _remoteDataSource.getNews();
        print(response);
        if(response.status == ApiInternalStatus.SUCCESS){
          print(response.dataResposne);
          return Right(response.toDomain());
        } else {
          return Left(Failure(ApiInternalStatus.FAILURE, ResponseMessage.DEFAULT));
        }
      } catch (error) {
        print("this is the error $error.toString()");
        
        return (Left(ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  
}
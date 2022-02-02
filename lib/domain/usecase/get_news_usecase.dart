import 'package:blog_app_v2/data/network/failure.dart';
import 'package:blog_app_v2/domain/model/model.dart';
import 'package:blog_app_v2/domain/repository/repository.dart';
import 'package:blog_app_v2/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class GetNewsUseCase extends BaseUseCase<void, News> {
  Repository _repository;

  GetNewsUseCase(this._repository);
  @override
  Future<Either<Failure, News>> execute(void input) async{
    return await _repository.getNews();
  }
}
import 'package:blog_app_v2/data/network/failure.dart';
import 'package:blog_app_v2/domain/model/model.dart';
import 'package:dartz/dartz.dart';

abstract class Repository{
  Future<Either<Failure, News>> getNews();
}
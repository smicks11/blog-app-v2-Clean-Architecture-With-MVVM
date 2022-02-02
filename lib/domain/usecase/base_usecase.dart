import 'package:blog_app_v2/data/network/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUseCase<In, Out>{
  Future<Either<Failure, Out>> execute(In input);
}
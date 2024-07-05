import 'package:dartz/dartz.dart';
import 'package:omniprotest/core/failure.dart';
import 'package:omniprotest/domain/entities/photo_entity.dart';

abstract class PhotoRepository {
  Future<Either<Failure, List<PhotoEntity>>> getPhotos({
    required int page,
  });
}

import 'package:dartz/dartz.dart';
import 'package:omniprotest/core/failure.dart';
import 'package:omniprotest/data/model/photo_model.dart';

abstract class PhotoRepository {
  Future<Either<Failure, List<PhotoModel>>> getPhotos({
    required int page,
  });
}

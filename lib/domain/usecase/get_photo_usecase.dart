import 'package:dartz/dartz.dart';
import 'package:omniprotest/core/failure.dart';
import 'package:omniprotest/data/model/photo_model.dart';
import 'package:omniprotest/domain/repository/photo_repository.dart';

class GetPhotoUseCase {
  final PhotoRepository repository;

  GetPhotoUseCase({required this.repository});

  Future<Either<Failure, List<PhotoModel>>> call({
    required page,
  }) {
    return repository.getPhotos(page: page);
  }
}

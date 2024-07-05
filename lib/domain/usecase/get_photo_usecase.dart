import 'package:dartz/dartz.dart';
import 'package:omniprotest/core/failure.dart';
import 'package:omniprotest/domain/entities/photo_entity.dart';
import 'package:omniprotest/domain/repository/photo_repository.dart';

class GetPhotoUseCase {
  final PhotoRepository repository;

  GetPhotoUseCase({required this.repository});

  Future<Either<Failure, List<PhotoEntity>>> call({
    required page,
  }) {
    return repository.getPhotos(page: page);
  }
}

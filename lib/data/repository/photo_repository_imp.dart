import 'package:dartz/dartz.dart';
import 'package:omniprotest/core/exceptions.dart';
import 'package:omniprotest/core/failure.dart';
import 'package:omniprotest/data/datasource/photo_datasource.dart';
import 'package:omniprotest/data/model/photo_model.dart';
import 'package:omniprotest/domain/repository/photo_repository.dart';

class PhotoRepositoryImp implements PhotoRepository {
  final PhotoDatasource datasource;

  PhotoRepositoryImp({required this.datasource});

  @override
  Future<Either<Failure, List<PhotoModel>>> getPhotos({
    required int page,
  }) async {
    try {
      final result = await datasource.getPhotos(page: page);
      return Right(result);
    } on ServerException catch (error) {
      return Left(
        ServerFailure(
          statusCode: error.statusCode,
          error: error.error!,
        ),
      );
    } on Exception catch (ex) {
      return Left(
        ServerFailure(
          error: ex.toString(),
        ),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          error: e.toString(),
        ),
      );
    }
  }
}

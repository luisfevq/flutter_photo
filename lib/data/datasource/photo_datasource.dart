import 'package:omniprotest/data/model/photo_model.dart';

abstract class PhotoDatasource {
  Future<List<PhotoModel>> getPhotos({
    required int page,
  });
}

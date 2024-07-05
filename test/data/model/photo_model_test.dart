import 'package:flutter_test/flutter_test.dart';
import 'package:omniprotest/data/model/photo_model.dart';

void main() {
  PhotoModel photoModel = PhotoModel(
    albumId: 1,
    id: 1,
    title: "accusamus beatae ad facilis cum similique qui sunt",
    url: "https://via.placeholder.com/600/92c952",
    thumbnailUrl: "https://via.placeholder.com/150/92c952",
  );

  test("Should be a subclass of photo_model", () async {
    // assert
    expect(photoModel, isA<PhotoModel>());
  });
  test("Should return a valid photo_model from json", () {
    // arrange
    final Map<String, dynamic> json = {
      "albumId": 1,
      "id": 1,
      "title": "accusamus beatae ad facilis cum similique qui sunt",
      "url": "https://via.placeholder.com/600/92c952",
      "thumbnailUrl": "https://via.placeholder.com/150/92c952"
    };
    // act
    final result = PhotoModel.fromJson(json);
    // except
    expect(result, equals(photoModel));
  });
  test("Should return a valid json from photo_model", () {
    // act
    final result = photoModel.toJson();
    // assert
    final expectJson = {
      "albumId": 1,
      "id": 1,
      "title": "accusamus beatae ad facilis cum similique qui sunt",
      "url": "https://via.placeholder.com/600/92c952",
      "thumbnailUrl": "https://via.placeholder.com/150/92c952"
    };
    // except
    expect(result, equals(expectJson));
  });
}

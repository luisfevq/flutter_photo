import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:omniprotest/data/model/photo_model.dart';
import 'package:omniprotest/domain/repository/photo_repository.dart';
import 'package:omniprotest/domain/usecase/get_photo_usecase.dart';

class MockPhotoRepository extends Mock implements PhotoRepository {}

void main() {
  setUpAll(() {
    registerFallbackValue(PhotoModel(
      albumId: 1,
      id: 1,
      title: "accusamus beatae ad facilis cum similique qui sunt",
      url: "https://via.placeholder.com/600/92c952",
      thumbnailUrl: "https://via.placeholder.com/150/92c952",
    ));
  });

  PhotoModel photoModel = PhotoModel(
    albumId: 1,
    id: 1,
    title: "accusamus beatae ad facilis cum similique qui sunt",
    url: "https://via.placeholder.com/600/92c952",
    thumbnailUrl: "https://via.placeholder.com/150/92c952",
  );

  test("Should getPhotos from the repository", () async {
    final mockPhotoRepo = MockPhotoRepository();
    final mockGetPhotoUseCase = GetPhotoUseCase(repository: mockPhotoRepo);

    when(() => mockPhotoRepo.getPhotos(page: 1))
        .thenAnswer((_) async => Right([photoModel]));

    final result = await mockGetPhotoUseCase.call(page: 1);

    expect(result.isRight(), true);
    result.fold(
      (failure) => fail('Should have returned a list of photos'),
      (photos) => expect(photos, [photoModel]),
    );

    verify(() => mockPhotoRepo.getPhotos(page: 1)).called(1);
  });
}

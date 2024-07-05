import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:omniprotest/core/failure.dart';
import 'package:omniprotest/data/model/photo_model.dart';
import 'package:omniprotest/domain/usecase/get_photo_usecase.dart';
import 'package:omniprotest/presentation/home/bloc/home_bloc.dart';

class MockPhotoUseCase extends Mock implements GetPhotoUseCase {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final mockGetPhotoUseCase = MockPhotoUseCase();
  const List<PhotoModel> listPhotos = [];
  group("(HomeBloc Test) GetPhotoApi", () {
    blocTest<HomeBloc, HomeState>(
      "Emmit: PhotoLoaded when GetPhotoApi is Success",
      build: () {
        when(
          () => mockGetPhotoUseCase.call(page: 1),
        ).thenAnswer((_) async {
          return Future.sync(() => const Right(listPhotos));
        });
        return HomeBloc(getPhotoUseCase: mockGetPhotoUseCase);
      },
      act: (bloc) => bloc.add(const GetPhotoApi(page: 1)),
      expect: () => <HomeState>[
        const PhotoLoading(),
        const PhotoLoaded(photos: listPhotos),
      ],
    );
    blocTest<HomeBloc, HomeState>(
      "Emmit: PhotoFailure when GetPhotoApi is Error",
      build: () {
        when(
          () => mockGetPhotoUseCase.call(page: 1),
        ).thenAnswer((_) async {
          return Future.sync(() => const Left(ServerFailure(error: "error")));
        });
        return HomeBloc(getPhotoUseCase: mockGetPhotoUseCase);
      },
      act: (bloc) => bloc.add(const GetPhotoApi(page: 1)),
      expect: () => <HomeState>[
        const PhotoLoading(),
        const PhotoFailure(message: "error"),
      ],
    );
  });
}

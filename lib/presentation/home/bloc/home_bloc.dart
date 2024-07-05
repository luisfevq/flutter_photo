import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omniprotest/domain/entities/photo_entity.dart';
import 'package:omniprotest/domain/usecase/get_photo_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetPhotoUseCase getPhotoUseCase;

  int _currentPage = 1;
  List<PhotoEntity> photos = [];

  HomeBloc({
    required this.getPhotoUseCase,
  }) : super(HomeInitial()) {
    on<GetPhotoApi>((event, emit) async {
      emit(const PhotoLoading());

      final response = await getPhotoUseCase.call(page: event.page);

      response.fold(
        (l) => emit(PhotoFailure(message: l.error)),
        (r) {
          photos.addAll(r);
          emit(PhotoLoaded(photos: r));
        },
      );
    });

    on<LoadMorePhotos>((event, emit) async {
      emit(const PhotoMoreLoading());
      _currentPage++;

      final response = await getPhotoUseCase.call(page: _currentPage);

      response.fold(
        (l) => emit(PhotoMoreFailure(message: l.error)),
        (r) {
          photos.addAll(r);
          emit(PhotoLoaded(photos: photos));
        },
      );
    });
  }
}

part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetPhotoApi extends HomeEvent {
  final int page;

  const GetPhotoApi({required this.page});
}

class LoadMorePhotos extends HomeEvent {}

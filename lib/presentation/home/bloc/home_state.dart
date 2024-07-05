part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class PhotoLoading extends HomeState {
  const PhotoLoading();
}

final class PhotoLoaded extends HomeState {
  final List<PhotoEntity> photos;

  const PhotoLoaded({required this.photos});
}

final class PhotoFailure extends HomeState {
  final String message;

  const PhotoFailure({required this.message});
}

final class PhotoMoreLoading extends HomeState {
  const PhotoMoreLoading();
}

final class PhotoMoreFailure extends HomeState {
  final String message;

  const PhotoMoreFailure({required this.message});
}

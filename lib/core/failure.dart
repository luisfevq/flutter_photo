import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String error;
  final int? statusCode;
  const Failure({
    required this.error,
    this.statusCode = 0,
  });

  @override
  List<Object?> get props => [error];
}

class ServerFailure extends Failure {
  const ServerFailure({
    required String error,
    int? statusCode = 0,
  }) : super(error: error, statusCode: statusCode);
}

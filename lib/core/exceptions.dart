class ServerException implements Exception {
  final String? error;
  final int? statusCode;

  ServerException({required this.error, required this.statusCode});
}

class LocalException implements Exception {
  final String? error;

  LocalException({required this.error});
}

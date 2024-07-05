abstract class StatusCode {
  static bool isValidHttpCode(int statusCode) {
    return [200, 201, 202, 203, 204].contains(statusCode);
  }
}

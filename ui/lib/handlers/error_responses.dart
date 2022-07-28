class ErrorResponse {
  final String message;
  final int statusCode;
  final String content;

  ErrorResponse({this.message, this.statusCode, this.content});

  @override
  String toString() =>
      "{ message:$message, statusCode:$statusCode, content:$content }";
}

abstract class TodoException implements Exception {
  final String message;
  StackTrace? stackTrace;
  TodoException(this.message);
}

class TodoFetchError extends TodoException {
  TodoFetchError(super.message);
}

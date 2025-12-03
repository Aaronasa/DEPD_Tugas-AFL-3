class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_message$_prefix';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
    : super(message, 'Error During Communication: ');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalid request: ');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message])
    : super(message, 'Unauthorised Request: ');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Invalid Input: ');
}

class NointernetException extends AppException {
  NointernetException([String? message])
    : super(message, 'No Internet Connection: ');
}

/// Dilempar saat resource / endpoint tidak ditemukan (404).
class NotFoundException implements Exception {
  final String message;
  NotFoundException(this.message);

  @override
  String toString() => 'NotFoundException: $message';
}

/// Dilempar saat terjadi kesalahan internal server (500+).
class ServerErrorException implements Exception {
  final String message;
  ServerErrorException(this.message);

  @override
  String toString() => 'ServerErrorException: $message';
}

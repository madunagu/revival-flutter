import 'package:meta/meta.dart';

abstract class ApiException implements Exception {}

class EmptyResultException extends ApiException {}

class ConnectionException extends ApiException {}

class ServerErrorException extends ApiException {}

class ClientErrorException extends ApiException {}

class ValidationErrorException extends ApiException {
  final Map<String, dynamic> errors;
  ValidationErrorException({@required this.errors});
}

class UnknownException extends ApiException {}

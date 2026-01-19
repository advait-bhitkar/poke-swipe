/// Domain error abstraction for use in domain layer only.
class Failure {
  final String message;
  final String? code;
  final dynamic details;

  Failure({required this.message, this.code, this.details});

  @override
  String toString() => 'Failure(message: $message, code: $code, details: $details)';
}


abstract class Failures {}

class ServerFailure extends Failures {
  final String? message;
  final String? code;

  ServerFailure(this.message, [this.code]);
}

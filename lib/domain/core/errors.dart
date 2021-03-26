import 'package:flutter_firebase_ddd/domain/core/failures.dart';

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Termination.';
    return Error.safeToString('$explanation Failure was: $valueFailure');
  }
}

import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_ddd/domain/core/errors.dart';
import 'package:flutter_firebase_ddd/domain/core/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [ValureFailure]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  bool isValid() => value
      .isRight(); // myEmailAddress.value.isRight() == myEmailAddress.isValid()

  @override
  bool operator ==(Object o) {
    if (identical(this, 0)) return true;

    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

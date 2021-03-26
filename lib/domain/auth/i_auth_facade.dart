import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_ddd/domain/auth/auth_failure.dart';
import 'package:flutter_firebase_ddd/domain/auth/value_objects.dart';

/// i : interface, facade : design pattern
/// The same level as 'repositories' int the layer diagram.
abstract class IAuthFacade {
  // Why we use 'Either & Unit', Treat null!!
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();
}

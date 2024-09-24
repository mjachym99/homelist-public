import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryException implements Exception {
  AuthRepositoryException(this.error);

  final Object? error;
}

class CreateUserFailure extends AuthRepositoryException {
  CreateUserFailure(super.error);
}

class UserNotFound extends AuthRepositoryException {
  UserNotFound(super.error);
}

class WrongPassword extends AuthRepositoryException {
  WrongPassword(super.error);
}

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// Upon successful login, User object is sent to all listeners.
  /// On log out, null is sent to all listeners
  final Stream<User?> userStream = FirebaseAuth.instance.authStateChanges();

  Future<Either<AuthRepositoryException, UserCredential?>> logIn({
    required String email,
    required String password,
  }) async {
    UserCredential? credential;
    try {
      credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Left(UserNotFound(e.message));
      } else if (e.code == 'wrong-password') {
        return Left(WrongPassword(e.message));
      } else {
        return Left(AuthRepositoryException(e.message));
      }
    }
  }

  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }

  Future<UserCredential?> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return result;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

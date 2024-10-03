// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:dartz/dartz.dart';
import 'package:user_repository/user_repository.dart';

abstract class UsersRepositoryGeneralFailure implements Exception {
  UsersRepositoryGeneralFailure(this.error);

  final Object? error;
}

class CreateUserFailure extends UsersRepositoryGeneralFailure {
  CreateUserFailure(super.error);
}

class GetUserDataFailure extends UsersRepositoryGeneralFailure {
  GetUserDataFailure(super.error);
}

class GetUsersToShareStreamFailure extends UsersRepositoryGeneralFailure {
  GetUsersToShareStreamFailure(super.error);
}

class UsersRepository {
  static const String _usersCollectionKey = 'users';

  final CollectionReference<Map<String, dynamic>> _usersCollection =
      FirebaseFirestore.instance.collection(
    _usersCollectionKey,
  );

  final StreamController<UserData?> userDataStream = StreamController<UserData?>();

  Future<Either<UsersRepositoryGeneralFailure, Map<String, dynamic>?>> createUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      final response = await FirebaseFunctions.instance
          .httpsCallable('createFirestoreUserHttp')
          .call<Map<String, dynamic>?>(
        {
          'email': email,
          'password': password,
          'firstName': firstName,
          'lastName': lastName,
          'avatarImage': '',
        },
      );
      return Right(response.data);
    } on FirebaseFunctionsException catch (err) {
      return Left(CreateUserFailure(err.message));
    }
  }

  Future<Either<UsersRepositoryGeneralFailure, void>> getUserData(String uid) async {
    try {
      final DocumentReference<Map<String, dynamic>> ref = _usersCollection.doc(uid);
      final DocumentSnapshot<Map<String, dynamic>> userRef = await ref.get();
      final Map<String, dynamic>? userData = userRef.data();

      if (userData != null) {
        userDataStream.add(
          UserData.fromJson(userData),
        );
      }
      return const Right(null);
    } catch (error) {
      return Left(GetUserDataFailure(error));
    }
  }

  Future<Stream<List<UserData>>> getUsersToShareStream(
    String currentUserId,
    List<String> usersToExclude,
  ) async {
    try {
      return _usersCollection
          .where(
            'id',
            whereNotIn: <Object?>[currentUserId, ...usersToExclude],
          )
          .snapshots()
          .map(
            (QuerySnapshot<Map<String, dynamic>> querySnapshot) {
              return querySnapshot.docs.map(
                (QueryDocumentSnapshot<Map<String, dynamic>> userData) {
                  final UserData user = UserData.fromJson(
                    userData.data(),
                  );

                  return user;
                },
              ).toList();
            },
          );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetUsersToShareStreamFailure(error), stackTrace);
    }
  }
}

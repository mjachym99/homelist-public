import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homelist/application/auth/auth_state.dart';
import 'package:homelist/application/core/preferences.dart';
import 'package:homelist/application/status.dart';
import 'package:homelist/repositories/auth/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_repository/user_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._usersRepository, this._authRepository)
      : super(
          const AuthState(
            isAuthenticated: false,
            authStatus: Status.initial,
            staySignedIn: false,
          ),
        ) {
    _firebaseUserStreamSubscription = _authRepository.userStream.listen(
      (User? user) async {
        if (user == null) {
          emit(
            state.copyWith(
              isAuthenticated: false,
              authStatus: Status.initial,
            ),
          );
        } else {
          // Emit succesful auth state + get user data from firestore
          await getUserData(user);
        }
      },
    );
    initialiseStaySignedIn();
  }

  final String _staySignedInPrefsKey = 'staySignedIn';
  final UsersRepository _usersRepository;
  final AuthRepository _authRepository;
  late final StreamSubscription<User?> _firebaseUserStreamSubscription;

  Future<void> authenticate({
    required String email,
    required String password,
  }) async {
    emit(
      state.copyWith(authStatus: Status.loading),
    );
    final result = await _authRepository.logIn(
      email: email,
      password: password,
    );

    // _firebaseUserStreamSubscription callback handles succesful login
    return result.fold(
      (exception) {
        emit(
          state.copyWith(
            authException: exception,
            authStatus: Status.error,
          ),
        );
      },
      (_) {},
    );
  }

  Future<void> getUserData(User user) async {
    await _usersRepository.getUserData(user.uid);
    emit(
      state.copyWith(
        isAuthenticated: true,
        authStatus: Status.loaded,
      ),
    );
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    emit(state.copyWith(authStatus: Status.initial));
  }

  // Redundant
  void initialiseStaySignedIn() {
    final SharedPreferences prefs = PreferencesController.preferencesInstance;
    final bool? ssi = prefs.getBool('staySignedIn');
    if (ssi == null) {
      prefs.setBool(_staySignedInPrefsKey, false);
    } else {
      emit(state.copyWith(staySignedIn: ssi));
    }
  }

  // Only for web
  void setStaySignedIn({required bool value}) {
    if (value) {
      FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
    } else {
      FirebaseAuth.instance.setPersistence(Persistence.NONE);
    }
    emit(state.copyWith(staySignedIn: value));
  }

  void setUserData() {}

  void logOut() {
    emit(
      state.copyWith(
        isAuthenticated: false,
      ),
    );
    _firebaseUserStreamSubscription.cancel();
  }

  Future<void> createUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    emit(
      state.copyWith(authStatus: Status.loading),
    );
    final result = await _usersRepository.createUser(
      email: email,
      firstName: firstName,
      lastName: lastName,
      password: password,
    );

    result.fold(
      (error) {
        emit(
          state.copyWith(
            authStatus: Status.error,
            authException: AuthRepositoryException(error.error),
          ),
        );
      },
      (result) {
        authenticate(email: email, password: password);
      },
    );
  }
}

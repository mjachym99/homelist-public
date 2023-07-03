import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:homelist/application/status.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required bool isAuthenticated,
    required bool staySignedIn,
    required Status authStatus,
    UserCredential? userCredential,
  }) = _AuthState;
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homelist/application/auth/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit()
      : super(
          const AuthState(
            isAuthenticated: false,
          ),
        );

  void authenticate() {
    emit(
      state.copyWith(
        isAuthenticated: !state.isAuthenticated,
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homelist/application/auth/auth_cubit.dart';
import 'package:homelist/presentation/screens/login/log_in_screen.dart';

class PreloginScreen extends StatefulWidget {
  const PreloginScreen({
    super.key,
  });
  static const routeName = '/prelogin';

  @override
  State<PreloginScreen> createState() => _PreloginScreenState();
}

class _PreloginScreenState extends State<PreloginScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final User? userFromPreviousSession = FirebaseAuth.instance.currentUser;
      if (userFromPreviousSession != null) {
        context.read<AuthCubit>().getUserData(
              userFromPreviousSession,
            );
      } else {
        context.go(LoginScreen.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

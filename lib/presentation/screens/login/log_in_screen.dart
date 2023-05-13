import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homelist/application/auth/auth_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  static const routeName = '/login';

  final emailController = TextEditingController.fromValue(
    const TextEditingValue(text: ''),
  );

  final passwordController = TextEditingController.fromValue(
    const TextEditingValue(text: ''),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              flex: 12,
              child: Container(),
            ),
            Text(
              'Welcome to HomeList!',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 24,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                controller: emailController,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                controller: passwordController,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthCubit>().authenticate();
                GoRouter.of(context).refresh();
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Log In"),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(Icons.login),
                ],
              ),
            ),
            Expanded(
              flex: 9,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homelist/application/auth/auth_cubit.dart';
import 'package:homelist/application/auth/auth_state.dart';
import 'package:homelist/application/core/navigation.dart';
import 'package:homelist/application/core/preferences.dart';
import 'package:homelist/application/status.dart';
import 'package:homelist/presentation/screens/login/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = '/login';
  static const _savedEmailPrefsKey = 'savedEmail';
  static const _savedPasswordPrefsKey = 'savedPassword';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController.fromValue(
    TextEditingValue.empty,
  );

  final passwordController = TextEditingController.fromValue(
    TextEditingValue.empty,
  );

  @override
  void initState() {
    super.initState();
    if (context.read<AuthCubit>().state.staySignedIn) {
      final savedEmail = PreferencesController.preferencesInstance.getString(
        LoginScreen._savedEmailPrefsKey,
      );
      final savedPassword = PreferencesController.preferencesInstance.getString(
        LoginScreen._savedPasswordPrefsKey,
      );
      emailController.value = TextEditingValue(text: savedEmail ?? '');
      passwordController.value = TextEditingValue(text: savedPassword ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                flex: 10,
                child: Container(),
              ),
              Text(
                'Welcome to HomeList!',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
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
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      controller: passwordController,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  if (kIsWeb)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            return Checkbox(
                              value: state.staySignedIn,
                              onChanged: (value) {
                                if (value != null) {
                                  context.read<AuthCubit>().setStaySignedIn(value: value);
                                }
                              },
                            );
                          },
                        ),
                        const Text('Keep me logged in.'),
                      ],
                    ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await context.read<AuthCubit>().authenticate(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                    final prefs = PreferencesController.preferencesInstance;
                    await prefs.setString(
                      LoginScreen._savedEmailPrefsKey,
                      emailController.text,
                    );
                    await prefs.setString(
                      LoginScreen._savedPasswordPrefsKey,
                      passwordController.text,
                    );
                  }
                },
                child: BlocConsumer<AuthCubit, AuthState>(
                  listenWhen: (previous, current) {
                    // Don't listen when the user toggles remembering credentials
                    return previous.staySignedIn == current.staySignedIn;
                  },
                  listener: (context, state) {
                    if (state.authStatus == Status.error) {
                      NavigationService.showErrorSnackbar(
                        context,
                        state.authException?.error,
                      );
                    }
                  },
                  builder: (context, state) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: state.authStatus == Status.loading
                          ? [
                              const SizedBox(
                                height: 12,
                                width: 12,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            ]
                          : [
                              const Text('Log In'),
                              const SizedBox(
                                width: 8,
                              ),
                              const Icon(Icons.login),
                            ],
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () {
                  context.go(SignUpScreen.routeName);
                },
                child: Text(
                  'Sign Up',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(fontWeight: FontWeight.normal),
                ),
              ),
              Expanded(
                flex: 9,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

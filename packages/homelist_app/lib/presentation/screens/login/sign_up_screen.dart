import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homelist/application/auth/auth_cubit.dart';
import 'package:homelist/application/auth/auth_state.dart';
import 'package:homelist/application/core/navigation.dart';
import 'package:homelist/application/status.dart';
import 'package:homelist/presentation/constants.dart';
import 'package:homelist/presentation/screens/login/log_in_screen.dart';
import 'package:homelist/presentation/widgets/common/homelist_appbar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const routeName = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  String? validator(String? value, String errorMessage) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeListAppBar(
        title: 'Sign Up',
        leading: IconButton(
          onPressed: () {
            context.go(LoginScreen.routeName);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: const [],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 64,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
                width: 144,
                height: 144,
                child: const Icon(
                  Icons.account_circle,
                  size: 128,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: TextFormField(
                  controller: _firstNameController,
                  validator: (value) {
                    return validator(value, 'Please enter your first name.');
                  },
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.person_outline_outlined),
                    label: const Text('First Name'),
                    hintStyle: const TextStyle(color: AppColors.hintTextColor),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: TextFormField(
                  controller: _lastNameController,
                  validator: (value) {
                    return validator(value, 'Please enter your last name.');
                  },
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.account_circle_outlined),
                    label: const Text('Last Name'),
                    hintStyle: const TextStyle(color: AppColors.hintTextColor),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    return validator(value, 'Please enter your email.');
                  },
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.email_outlined),
                    label: const Text('Email'),
                    hintStyle: const TextStyle(color: AppColors.hintTextColor),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    return validator(value, 'Type in your password');
                  },
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.lock_outline_rounded),
                    label: const Text('Password'),
                    hintStyle: const TextStyle(color: AppColors.hintTextColor),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: TextFormField(
                  controller: _repeatPasswordController,
                  validator: (value) {
                    return validator(value, 'Type in your password again');
                  },
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.lock_outline_rounded),
                    label: const Text('Confirm password'),
                    hintStyle: const TextStyle(color: AppColors.hintTextColor),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state.authStatus == Status.error) {
                            NavigationService.showErrorSnackbar(
                              context,
                              state.authException?.error,
                            );
                          }
                        },
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await context.read<AuthCubit>().createUser(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                      firstName: _firstNameController.text,
                                      lastName: _lastNameController.text,
                                    );
                              }
                            },
                            child: state.authStatus == Status.loading
                                ? const SizedBox(
                                    height: 12,
                                    width: 12,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Text('Sign Up'),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

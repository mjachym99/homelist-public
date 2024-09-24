import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homelist/presentation/constants.dart';
import 'package:homelist/presentation/screens/budget/expense_details_screen.dart';
import 'package:homelist/presentation/screens/budget/expense_group_screen.dart';
import 'package:homelist/presentation/screens/lists/list_details_screen.dart';
import 'package:homelist/presentation/screens/login/log_in_screen.dart';
import 'package:homelist/presentation/screens/login/sign_up_screen.dart';
import 'package:homelist/presentation/screens/navigation/navigation_screen.dart';
import 'package:homelist/presentation/widgets/budget/add_expense_form.dart';

class NavigationService {
  NavigationService._();

  static GoRouter get router => _router;

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static late GoRouter _router;

  static void initRouter({
    required bool auth,
  }) {
    _router = _createRouter(auth: auth);
  }

  static GoRouter _createRouter({
    required bool auth,
  }) {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      redirect: (context, state) {
        return _redirect(
          context,
          state,
          auth: auth,
        );
      },
      routes: allRoutes,
    );
  }

  static FutureOr<String?> _redirect(
    BuildContext context,
    GoRouterState state, {
    required bool auth,
  }) {
    if (auth) {
      return null;
    } else {
      switch (state.matchedLocation) {
        case '/sign-up':
          return SignUpScreen.routeName;
        default:
          return '/login';
      }
    }
  }

  static void showErrorSnackbar(BuildContext context, Object? error) {
    final snackBar = SnackBar(
      backgroundColor: AppColors.debtRed,
      content: Text(
        error.toString(),
      ),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16,
      ),
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static final allRoutes = [
    GoRoute(
      name: 'Login',
      path: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: 'Home',
      path: NavigationScreen.routeName,
      builder: (context, state) => const NavigationScreen(
        title: Labels.homePageTitle,
      ),
    ),
    GoRoute(
      name: 'ListDetails',
      path: ListDetailsScreen.routeName,
      builder: (context, state) => const ListDetailsScreen(),
    ),
    GoRoute(
      name: 'SignUp',
      path: SignUpScreen.routeName,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      name: 'ExpenseGroup',
      path: ExpenseGroupScreen.routeName,
      builder: (context, state) => const ExpenseGroupScreen(),
    ),
    GoRoute(
      name: 'AddExpense',
      path: AddExpenseFormScreen.routeName,
      builder: (context, state) => const AddExpenseFormScreen(),
    ),
    GoRoute(
      name: 'ExpenseDetailsScreen',
      path: ExpenseDetailsScreen.routeName,
      builder: (context, state) => const ExpenseDetailsScreen(),
    ),
  ];
}

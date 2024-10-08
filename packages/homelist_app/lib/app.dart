import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homelist/application/auth/auth_cubit.dart';
import 'package:homelist/application/bottom_nav/bottom_nav_cubit.dart';
import 'package:homelist/application/budget/budget_cubit.dart';
import 'package:homelist/application/core/navigation.dart';
import 'package:homelist/application/shared_lists/shared_list_cubit.dart';
import 'package:homelist/application/status.dart';
import 'package:homelist/application/user/user_cubit.dart';
import 'package:homelist/getit_config.dart';
import 'package:homelist/presentation/constants.dart';
import 'package:homelist/repositories/auth/auth_repository.dart';
import 'package:homelist/repositories/firestore/expenses_repository.dart';
import 'package:homelist/repositories/firestore/firestore_repository.dart';
import 'package:user_repository/user_repository.dart';

class HomeList extends StatelessWidget {
  const HomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<StateStreamableSource<Object?>>>[
        BlocProvider<AuthCubit>(
          create: (BuildContext context) => AuthCubit(
            getIt<UsersRepository>(),
            getIt<AuthRepository>(),
          ),
        ),
        BlocProvider<BottomNavCubit>(
          create: (BuildContext context) => BottomNavCubit(),
          lazy: false,
        ),
        BlocProvider<UserCubit>(
          create: (BuildContext context) => UserCubit(
            getIt<UsersRepository>(),
          ),
          lazy: false,
        ),
        BlocProvider<SharedListCubit>(
          create: (BuildContext context) => SharedListCubit(
            getIt<FirestoreRepository>(),
          ),
        ),
        BlocProvider<BudgetCubit>(
          create: (BuildContext context) => BudgetCubit(
            getIt<ExpensesRepository>(),
          ),
        ),
      ],
      child: Builder(
        builder: (BuildContext context) {
          NavigationService.initRouter(
            auth: context.select<AuthCubit, bool>(
              (AuthCubit cubit) => cubit.state.authStatus == Status.loaded,
            ),
          );
          final GoRouter router = NavigationService.router;
          return MaterialApp.router(
            title: 'HomeList',
            theme: appTheme,
            debugShowCheckedModeBanner: false,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
            routerDelegate: router.routerDelegate,
          );
        },
      ),
    );
  }
}

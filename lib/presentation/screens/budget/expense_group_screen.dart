import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homelist/application/budget/budget_cubit.dart';
import 'package:homelist/application/budget/budget_cubit_state.dart';
import 'package:homelist/application/user/user_cubit.dart';
import 'package:homelist/models/user/user.dart';
import 'package:homelist/presentation/widgets/budget/add_expense_form.dart';
import 'package:homelist/presentation/widgets/budget/expense_tile.dart';
import 'package:homelist/presentation/widgets/common/homelist_appbar.dart';
import 'package:homelist/presentation/widgets/common/user_tile.dart';
import 'package:homelist/presentation/widgets/lists/share_to_users_dialog.dart';

class ExpenseGroupScreen extends StatelessWidget {
  const ExpenseGroupScreen({super.key});

  static const routeName = '/expense_group_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BudgetCubit, BudgetCubitState>(
      builder: (context, state) {
        final currentExpenseGroup = state.currentExpenseGroup!;
        return Scaffold(
          appBar: HomeListAppBar(
            title: currentExpenseGroup.groupName,
            actions: const [],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.push(AddExpenseFormScreen.routeName);
            },
            shape: const CircleBorder(),
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          bottomNavigationBar: Container(
            height: kBottomNavigationBarHeight,
            color: Theme.of(context).colorScheme.secondaryContainer,
            width: MediaQuery.of(context).size.width,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Group Members:',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...currentExpenseGroup.members.map(
                        (UserData userData) => UserTile(
                          userData: userData,
                        ),
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return ShareToUsersDialog(
                                    onShare: (List<UserData> usersToShare) {
                                      context
                                          .read<BudgetCubit>()
                                          .addUsersToExpenseGroup(
                                            usersToShare,
                                          );
                                    },
                                    usersToExclude: state
                                        .currentExpenseGroup!.members
                                        .map((UserData user) => user.id)
                                        .toList(),
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(8),
                              shape: const CircleBorder(),
                            ),
                            child: const Icon(
                              Icons.add,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Divider(
                  indent: 48,
                  endIndent: 48,
                ),
                const SizedBox(
                  height: 8,
                ),
                ...currentExpenseGroup.expenses.map(
                  (expense) => ExpenseTile(
                    expense: expense,
                    expenseGroup: currentExpenseGroup,
                    currentUser: context.read<UserCubit>().state.userData!,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

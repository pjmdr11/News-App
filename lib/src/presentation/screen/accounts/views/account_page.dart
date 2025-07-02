import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kliq_technical_test/src/core/di/injection.dart';
import 'package:kliq_technical_test/src/presentation/custom_widgets/custom_widgets.dart';
import 'package:kliq_technical_test/src/presentation/screen/accounts/account.dart';
import 'package:kliq_technical_test/src/presentation/screen/home/cubit/home_cubit.dart';

@RoutePage()
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AccountCubit>(
        create: (ctx) {
          var cubit = getIt<AccountCubit>();
          cubit.getAccountDetails();
          return cubit;
        },
        child: BlocConsumer<AccountCubit, AccountState>(
            builder: (ctx, state) {
              if (state.isLoading ?? true) {
                return Center(
                  child: CustomLoader(),
                );
              } else {
                String email = state.userDb?.data?.email ?? "";
                String name = state.userDb?.data?.name ?? "";

                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 120, horizontal: 40),
                  child: Column(
                    children: [
                      Card(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Theme.of(context).canvasColor,
                                    ),
                                    child: const Icon(
                                      Icons.person,
                                      size: 80,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall),
                                        Text(email,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge)
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Card(
                          child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          getIt<AccountCubit>().logoutUser();
                          getIt<HomeCubit>().init();
                        },
                        child: SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 12,
                              ),
                              child: Center(
                                child: Text(
                                  "Logout",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            )),
                      ))
                    ],
                  ),
                );
              }
            },
            listener: (ctx, state) {}),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kliq_technical_test/src/core/route/AppRouter.dart';
import 'package:kliq_technical_test/src/core/styles/styles.dart';
import 'package:kliq_technical_test/src/presentation/screen/app/app.dart';

class AppView extends StatelessWidget {
  AppView({super.key});
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp.router(
            builder: FToastBuilder(),
            debugShowCheckedModeBanner: false,
            themeMode: state.appTheme,
            routerConfig: _appRouter.config(),
            theme: AppTheme.getLightTheme(),
            darkTheme: AppTheme.getDarkTheme(),
          );
        },
        listener: (state, newState) {});
  }
}

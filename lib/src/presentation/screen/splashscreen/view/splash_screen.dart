import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kliq_technical_test/src/core/di/injection.dart';
import 'package:kliq_technical_test/src/presentation/screen/splashscreen/cubit/splashcreen_cubit.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final autorouter = AutoRouter.of(context);
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      child: BlocProvider<SplashcreenCubit>(
        create: (context) => getIt<SplashcreenCubit>(),
        child: BlocConsumer<SplashcreenCubit, SplashcreenState>(
          listener: (context, state) {
            if (state is SplashCompleted) {
              autorouter.replaceNamed(state.route);
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.newspaper_outlined,
                  size: 200,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  width: 120,
                  child: LinearProgressIndicator(
                    minHeight: 4,
                  ),
                )
              ],
            );
          },
        ),
      ),
    ));
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kliq_technical_test/src/core/constants/app_constants.dart';
import 'package:kliq_technical_test/src/core/constants/id_constants.dart';
import 'package:kliq_technical_test/src/core/di/injection.dart';
import 'package:kliq_technical_test/src/core/resources/data_state.dart';
import 'package:kliq_technical_test/src/core/route/AppRouter.gr.dart';
import 'package:kliq_technical_test/src/core/utils/utils.dart';
import 'package:kliq_technical_test/src/presentation/custom_widgets/custom_widgets.dart';
import 'package:kliq_technical_test/src/presentation/screen/login/login.dart';

@RoutePage<bool>(
  name: "login",
)
class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final formKey = GlobalKey<FormState>();
  final LoginCubit? _loginCubit = getIt();
  var router;
  @override
  Widget build(BuildContext context) {
    router = AutoRouter.of(context);
    final defaultInputborder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey[300]!,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(50)),
    );
    final focusedInputBorder = defaultInputborder.copyWith(
        borderSide: BorderSide(color: Theme.of(context).highlightColor));
    return Scaffold(
      body: BlocProvider<LoginCubit>(
        create: (context) {
          _loginCubit?.setFormkey(formKey);
          return _loginCubit!;
        },
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.appState is ResultSuccess) {
              router.maybePop(true);
            } else if (state.appState is ResultFailure) {
              Fluttertoast.showToast(
                  msg: state.appState?.appException?.message ?? "");
            } else if (state.isLoading ?? false) {
              FocusScope.of(context).unfocus();
            }
          },
          builder: (ctx, state) {
            return Container(
              margin: const EdgeInsets.all(32),
              child: Center(
                child: Card(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 14),
                    padding: const EdgeInsets.all(12),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.newspaper,
                              size: 120,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Login",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            CustomTextInputView(
                              hint: labelHintEmail,
                              isDense: true,
                              widgetId: idInputTypeEmail,
                              textlabel: labelEmail,
                              validator: Validators.emailValidator,
                              textChangedCallback: (id, value) {
                                _loginCubit?.onEmailChanged(value);
                              },
                              errorMap:
                                  state.appState?.appException?.errorMap ?? {},
                              primaryIcon: Icon(
                                Icons.email,
                                color: Theme.of(context).iconTheme.color,
                              ),
                              focusedBorder: focusedInputBorder,
                              labelBorder: defaultInputborder,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextInputView(
                              hint: labelHintPassword,
                              isDense: true,
                              textlabel: labelPassword,
                              widgetId: idInputTypePassword,
                              textChangedCallback: (id, value) {
                                _loginCubit?.onPasswordChanged(value);
                              },
                              validator: Validators.passwordValidator,
                              errorMap:
                                  state.appState?.appException?.errorMap ?? {},
                              inputType: TextInputType.visiblePassword,
                              obscure: true,
                              primaryIcon: Icon(
                                Icons.password,
                                color: Theme.of(context).iconTheme.color,
                              ),
                              focusedBorder: focusedInputBorder,
                              labelBorder: defaultInputborder,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: CustomElevatedButton(
                                  border: 100,
                                  verticalPadding: 4,
                                  loading: state.isLoading ?? false,
                                  title: textLogin,
                                  onPressed: () {
                                    _loginCubit?.loginUser();
                                  }),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextButton(
                                onPressed: () async {
                                  var results = await context.router
                                      .push<bool>(Registration());
                                  if (results ?? false) {
                                    router.maybePop<bool>(true);
                                  }
                                },
                                child: const Text("Not a member? Sign up.")),
                            TextButton(
                                onPressed: () {
                                  context.maybePop(false);
                                },
                                child: const Text("Close"))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

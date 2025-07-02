import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kliq_technical_test/src/core/constants/app_constants.dart';
import 'package:kliq_technical_test/src/core/constants/id_constants.dart';
import 'package:kliq_technical_test/src/core/di/injection.dart';
import 'package:kliq_technical_test/src/core/resources/data_state.dart';
import 'package:kliq_technical_test/src/core/utils/utils.dart';
import 'package:kliq_technical_test/src/presentation/custom_widgets/custom_widgets.dart';
import 'package:kliq_technical_test/src/presentation/screen/registration/cubit/registration_cubit.dart';
import 'package:kliq_technical_test/src/presentation/screen/registration/registration.dart';

@RoutePage<bool>()
class Registration extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final RegistrationCubit regCubit = getIt();
  var router;
  Registration({super.key});

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
      body: BlocProvider<RegistrationCubit>(
        create: (ctx) {
          regCubit.setFormState(formKey);
          return regCubit;
        },
        child: BlocConsumer<RegistrationCubit, RegistrationState>(
          listener: (context, state) {
            if (state.appState is ResultSuccess) {
              Fluttertoast.showToast(msg: msgRegistrationSuccess);
              router.maybePop<bool>(true);
            } else if (state.appState is ResultFailure) {
              Fluttertoast.showToast(
                  msg: state.appState?.appException?.message ?? "",
                  backgroundColor: Colors.red);
            } else if (state.isLoading ?? false) {
              FocusScope.of(context).unfocus();
            }
          },
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Registration",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Card(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            CustomTextInputView(
                              hint: labelHintUserName,
                              isDense: true,
                              widgetId: idInputTypeUsername,
                              textlabel: labelUserName,
                              required: true,
                              validationMsg: errNameEmpty,
                              textChangedCallback: (id, value) {
                                regCubit.onNameChanged(value);
                              },
                              errorMap:
                                  state.appState?.appException?.errorMap ?? {},
                              primaryIcon: Icon(
                                Icons.person,
                                color: Theme.of(context).iconTheme.color,
                              ),
                              focusedBorder: focusedInputBorder,
                              labelBorder: defaultInputborder,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextInputView(
                              hint: labelHintEmail,
                              isDense: true,
                              widgetId: idInputTypeEmail,
                              validator: Validators.emailValidator,
                              textlabel: labelEmail,
                              textChangedCallback: (id, value) {
                                regCubit.onEmailChanged(value);
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
                              widgetId: idInputTypePassword,
                              textlabel: labelPassword,
                              obscure: true,
                              validator: Validators.passwordValidator,
                              inputType: TextInputType.visiblePassword,
                              textChangedCallback: (id, value) {
                                regCubit.onPasswordChanged(value);
                              },
                              errorMap:
                                  state.appState?.appException?.errorMap ?? {},
                              primaryIcon: Icon(
                                Icons.password_outlined,
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
                                  title: textRegister,
                                  onPressed: () {
                                    regCubit.registerUser();
                                  }),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: TextButton(
                                  onPressed: () {
                                    context.maybePop<bool>(true);
                                  },
                                  child: const Text("Go back to login.")),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

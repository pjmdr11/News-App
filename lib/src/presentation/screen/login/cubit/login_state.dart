part of 'login_cubit.dart';

class LoginState extends Equatable {
  String? email, password;
  bool? isLoading;
  DataState? appState;

  LoginState(
      {this.email, this.password, this.isLoading = false, this.appState});

  LoginState copyWith(
      {String? email, String? password, bool? isLoading, DataState? state}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        appState: state,
        isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object> get props => [
        email ?? "",
        password ?? "",
        isLoading ?? false,
      ];
}

class LoginInitial extends LoginState {
  LoginInitial() : super();
}

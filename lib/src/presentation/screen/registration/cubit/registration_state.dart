part of 'registration_cubit.dart';

@injectable
class RegistrationState extends Equatable {
  String? email, password, fullName;
  bool? isLoading;
  DataState? appState;

  RegistrationState(
      {this.email,
      this.password,
      this.fullName,
      this.isLoading = false,
      this.appState});

  RegistrationState copyWith(
      {String? email,
      String? password,
      String? fullName,
      bool? isLoading,
      DataState? state}) {
    var regState = RegistrationState(
        email: email ?? this.email,
        fullName: fullName ?? this.fullName,
        password: password ?? this.password,
        appState: state,
        isLoading: isLoading ?? this.isLoading);
    return regState;
  }

  @override
  List<Object> get props => [
        email ?? "",
        password ?? "",
        fullName ?? "",
        isLoading ?? false,
      ];
}

// ignore_for_file: must_be_immutable

part of 'login_cubit.dart';

class LoginState extends Equatable {
  final BuildContext context;
  late bool loading;
  late bool showPassword;
  late bool btnEbnabled;
  LoginState({
    required this.context,
    this.loading = false,
    this.btnEbnabled = false,
    this.showPassword = false,
  });

  @override
  List<Object> get props => [context, loading, btnEbnabled, showPassword];
  LoginState copyWith(
          {BuildContext? context,
          bool? loading,
          bool? btnEbnabled,
          bool? showPassword}) =>
      LoginState(
        context: context ?? this.context,
        loading: loading ?? this.loading,
        btnEbnabled: btnEbnabled ?? this.btnEbnabled,
        showPassword: showPassword ?? this.showPassword,
      );
}

// ignore_for_file: must_be_immutable

part of 'register_cubit.dart';

class RegisterState extends Equatable {
    final BuildContext context;

  late bool loading;
  late bool showPassword;
  late bool showPasswordConf;
  late bool btnEbnabled;
  RegisterState({
      required this.context,
    this.loading = false,
    this.btnEbnabled = false,
    this.showPassword = false,
    this.showPasswordConf = false,
  });

  @override
  List<Object> get props => [context, loading, btnEbnabled, showPassword,showPasswordConf];

  RegisterState copyWith({BuildContext? context,
          bool? loading,
          bool? btnEbnabled,
          bool? showPassword,
          bool? showPasswordConf}) =>
      RegisterState(
               context: context ?? this.context,
        loading: loading ?? this.loading,
        btnEbnabled: btnEbnabled ?? this.btnEbnabled,
        showPassword: showPassword ?? this.showPassword, 
        showPasswordConf: showPasswordConf ?? this.showPasswordConf, 

      );
}

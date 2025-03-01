// ignore_for_file: must_be_immutable

part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final BuildContext context;
  late bool loading;
  RegisterState({
    required this.context,
    this.loading = false,
  });

  @override
  List<Object> get props => [context, loading];

  RegisterState copyWith({BuildContext? context, bool? loading}) =>
      RegisterState(
        context: context ?? this.context,
        loading: loading ?? this.loading,
      );
}

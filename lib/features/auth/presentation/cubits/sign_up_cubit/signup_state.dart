part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final UserEntity userEntity;

  SignupSuccess({required this.userEntity});
}

class SignupFailure extends SignupState {
  final String errorMessage;

  SignupFailure({required this.errorMessage});
}

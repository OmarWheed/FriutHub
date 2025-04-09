part of 'signin_cubit.dart';

@immutable
sealed class SignInState {}

class SigninInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  final UserEntity userEntity;

  SignInSuccess({required this.userEntity});
}

class SignInFailure extends SignInState {
  final String errorMessage;

  SignInFailure({required this.errorMessage});
}

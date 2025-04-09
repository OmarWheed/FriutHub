import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/auth/domin/entites/user_entity.dart';
import 'package:fruits_hub/features/auth/domin/repo/auth_repo.dart';

part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SigninInitial());
  AuthRepo authRepo;
  Future<void> signIn({required String email, required String password}) async {
    emit(SignInLoading());
    var result = await authRepo.signInWithEmailAndPassword(
        email: email, password: password);
    result.fold(
      (failure) => emit(
        SignInFailure(errorMessage: failure.message),
      ),
      (userEntity) => emit(
        SignInSuccess(userEntity: userEntity),
      ),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SignInLoading());
    var result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(
        SignInFailure(errorMessage: failure.message),
      ),
      (userEntity) => emit(
        SignInSuccess(userEntity: userEntity),
      ),
    );
  }

  Future<void> signInWithFacebook() async {
    emit(SignInLoading());
    var result = await authRepo.signInWithFacebook();
    result.fold(
      (failure) => emit(
        SignInFailure(errorMessage: failure.message),
      ),
      (userEntity) => emit(
        SignInSuccess(userEntity: userEntity),
      ),
    );
  }
}

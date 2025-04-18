import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/error/failure.dart';
import 'package:fruits_hub/features/auth/domin/entites/user_entity.dart';

abstract class AuthRepo {
//SignUp
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      {required String email, required String password, required String name});
//signIn
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      {required String email, required String password});
//signInWithGoogle
  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future<Either<Failure, UserEntity>> signInWithFacebook();
  //firestore
  Future addUserData({required UserEntity user});
  Future<UserEntity> getUserData({required String uid});

}

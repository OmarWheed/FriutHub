import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/error/exception.dart';
import 'package:fruits_hub/core/error/failure.dart';
import 'package:fruits_hub/core/helper/build_debug_print_color.dart';
import 'package:fruits_hub/core/services/db_service.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/core/utils/backend_endpoints.dart';
import 'package:fruits_hub/features/auth/data/models/user.model.dart';
import 'package:fruits_hub/features/auth/domin/entites/user_entity.dart';
import 'package:fruits_hub/features/auth/domin/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService dbService;

  AuthRepoImpl({required this.firebaseAuthService, required this.dbService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserEntity(name: name, email: email, uId: user.uid);
      await addUserData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return Left(ServerFailure(e.message));
    } catch (e) {
      PrintMessage("catch Exception in AuthRepoImpl -->$e").r;
      await deleteUser(user);
      return Left(ServerFailure(
          "لم نتمكن من الاتصال بالخادم، يرجى المحاولة مرة أخرى لاحقًا"));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      var userData = await getUserData(uid: user.uid);
      return Right(userData);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      PrintMessage("catch Exception in AuthRepoImpl -->$e").r;
      return Left(ServerFailure(
          "لم نتمكن من الاتصال بالخادم، يرجى المحاولة مرة أخرى لاحقًا"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExists = await dbService.checkIfDataExists(
          path: BackendEndpoints.isUserExists, docId: userEntity.uId);
      if (isUserExists) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return Right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      PrintMessage("catch Exception in AuthRepoImpl -->$e").r;
      return left(ServerFailure(
          "لم نتمكن من الاتصال بالخادم، يرجى المحاولة مرة أخرى لاحقًا"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;

    try {
      var user = await firebaseAuthService.signInWithFackBook();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExists = await dbService.checkIfDataExists(
          path: BackendEndpoints.isUserExists, docId: userEntity.uId);
      if (isUserExists) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return Right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      PrintMessage("catch Exception in AuthRepoImpl -->$e").r;
      return left(ServerFailure(
          "لم نتمكن من الاتصال بالخادم، يرجى المحاولة مرة أخرى لاحقًا"));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await dbService.addData(
        path: BackendEndpoints.addUsers, data: user.toMap, docId: user.uId);
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userData = await dbService.getData(
        path: BackendEndpoints.getUsersData, docId: uid);
    return UserModel.fromJson(userData);
  }
}

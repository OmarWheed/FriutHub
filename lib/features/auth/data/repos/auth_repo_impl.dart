import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/error/exception.dart';
import 'package:fruits_hub/core/error/failure.dart';
import 'package:fruits_hub/core/helper/build_debug_print_color.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/features/auth/data/models/user.model.dart';
import 'package:fruits_hub/features/auth/domin/entites/user_entity.dart';
import 'package:fruits_hub/features/auth/domin/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl(this.firebaseAuthService);
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      PrintMessage("catch Exception in AuthRepoImpl -->$e").r;
      return Left(ServerFailure(
          "لم نتمكن من الاتصال بالخادم، يرجى المحاولة مرة أخرى لاحقًا"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      return Right(UserModel.fromFirebaseUser(user));
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
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      PrintMessage("catch Exception in AuthRepoImpl -->$e").r;
      return left(ServerFailure(
          "لم نتمكن من الاتصال بالخادم، يرجى المحاولة مرة أخرى لاحقًا"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      var user = await firebaseAuthService.signInWithFackBook();
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      PrintMessage("catch Exception in AuthRepoImpl -->$e").r;
      return left(ServerFailure(
          "لم نتمكن من الاتصال بالخادم، يرجى المحاولة مرة أخرى لاحقًا"));
    }
  }
}

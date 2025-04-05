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
      return Left(
          ServerFailure("Couldn't connect to Server please try again later"));
    }
  }
}

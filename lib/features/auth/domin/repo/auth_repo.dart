import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/error/failure.dart';
import 'package:fruits_hub/features/auth/domin/entites/user_entity.dart';

abstract class AuthRepo {
// create email with email and password
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      {required String email, required String password, required String name});
//signup
}

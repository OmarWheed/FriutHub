import 'package:fruits_hub/core/services/db_service.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/core/services/firebase_store_service.dart';
import 'package:fruits_hub/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_hub/features/auth/domin/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
    firebaseAuthService: getIt<FirebaseAuthService>(),
    dbService: getIt<DatabaseService>(),
  ));
}

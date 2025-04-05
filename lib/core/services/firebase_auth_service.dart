import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/error/exception.dart';
import 'package:fruits_hub/core/helper/build_debug_print_color.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      PrintMessage("catch Exception in FirebaseAuthService -->$e").r;
      if (e.code == 'weak-password') {
        throw CustomException('الرقم السري ضعيق جدا');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('الحساب موجود بالفعل لهذا البريد الإلكتروني.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException('لفد حدث خطاء في الاتصال بالانترنت');
      } else {
        throw CustomException("حدث خطأ. يرجى المحاولة مرة أخرى لاحقًا.");
      }
    } catch (e) {
      PrintMessage("catch Exception in FirebaseAuthService -->$e").r;
      throw CustomException("حدث خطأ. يرجى المحاولة مرة أخرى لاحقًا.");
    }
  }
}

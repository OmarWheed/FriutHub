import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_hub/core/error/exception.dart';
import 'package:fruits_hub/core/helper/build_debug_print_color.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
      PrintMessage("catch Exception in FirebaseAuthService (SignUp) -->$e").r;
      throw CustomException("حدث خطأ. يرجى المحاولة مرة أخرى لاحقًا.");
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException('هنالك خطا في البريد الالكتروني او الرقم السرئ');
      } else if (e.code == 'wrong-password') {
        throw CustomException('هنالك خطا في البريد الالكتروني او الرقم السرئ');
      } else if (e.code == 'network-request-failed') {
        throw CustomException('لفد حدث خطاء في الاتصال بالانترنت');
      } else {
        throw CustomException("حدث خطأ. يرجى المحاولة مرة أخرى لاحقًا.");
      }
    } catch (e) {
      PrintMessage("catch Exception in FirebaseAuthService (Login)-->$e").r;
      throw CustomException("$e");
    }
  }

  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleUser == null) {
        const PrintMessage("this is error ").g;
        // User cancelled the picker
        throw CustomException('لم يتم العثور على حساب جوجل');
      }
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth!.accessToken,
        idToken: googleAuth.idToken,
      );

      return (await FirebaseAuth.instance.signInWithCredential(credential))
          .user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        throw CustomException('لفد حدث خطاء في الاتصال بالانترنت');
      } else {
        throw CustomException(
            "فشل الاتصال الآمن بالخادم. تأكد من اتصال الإنترنت وجرب مرة أخرى.");
      }
    } catch (e) {
      PrintMessage(
              "catch Exception in FirebaseAuthService (SignInWithGoogle)-->$e")
          .r;

      rethrow;
    }
  }

//TODO: this function not complete Yet(Problem in yahoo facebook develper)
  Future<User> signInWithFackBook() async {
    // Trigger the sign-in flow
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      // Once signed in, return the UserCredential
      return (await FirebaseAuth.instance
              .signInWithCredential(facebookAuthCredential))
          .user!;
    } catch (e) {
      PrintMessage(
              "catch Exception in FirebaseAuthService (SignInWithGoogle)-->$e")
          .r;

      throw CustomException("حدث خطأ. يرجى المحاولة مرة أخرى لاحقًا.");
    }
  }
}

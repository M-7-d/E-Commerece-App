import 'package:en_ecommerce/data/repositories/user/user_Repositrory.dart';
import 'package:en_ecommerce/features/authentication/screens/auth/login.dart';
import 'package:en_ecommerce/features/authentication/screens/onboarding/onboarding.dart';
import 'package:en_ecommerce/features/authentication/screens/verfyEmail/verifyemail.dart';
import 'package:en_ecommerce/navigation_Menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      if (kDebugMode) {
        print("=====================GET STORAGE=====================");
        print(deviceStorage.read("IsFirstTime"));
      }
      deviceStorage.writeIfNull("IsFirstTime", true);
      deviceStorage.read("IsFirstTime") != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

  Future<UserCredential> loginwithEmailandPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.message.toString());
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.message.toString());
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw PlatformException(code: e.message.toString());
    } catch (e) {
      throw "Somwthing Went Wrong. Please try again";
    }
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.message.toString());
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.message.toString());
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw PlatformException(code: e.message.toString());
    } catch (e) {
      throw "Somwthing Went Wrong. Please try again";
    }
  }

  Future<void> reAuthenticateWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.message.toString());
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.message.toString());
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw PlatformException(code: e.message.toString());
    } catch (e) {
      throw "Somwthing Went Wrong. Please try again";
    }
  }

  Future<void> sendEmailVerifycation() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.message.toString());
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.message.toString());
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw PlatformException(code: e.message.toString());
    } catch (e) {
      throw "Somwthing Went Wrong. Please try again";
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.message.toString());
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.message.toString());
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw PlatformException(code: e.message.toString());
    } catch (e) {
      throw "Somwthing Went Wrong. Please try again";
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.message.toString());
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.message.toString());
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw PlatformException(code: e.message.toString());
    } catch (e) {
      throw "Somwthing Went Wrong. Please try again";
    }
  }

  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.message.toString());
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.message.toString());
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw PlatformException(code: e.message.toString());
    } catch (e) {
      throw "Somwthing Went Wrong. Please try again";
    }
  }

  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.message.toString());
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.message.toString());
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw PlatformException(code: e.message.toString());
    } catch (e) {
      throw "Somwthing Went Wrong. Please try again";
    }
  }
}

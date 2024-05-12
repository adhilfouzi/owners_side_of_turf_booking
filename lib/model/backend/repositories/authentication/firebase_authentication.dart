import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../../view/course/bottom_navigationbar_widget.dart';
import '../../../../view/onboarding/signup/screen/a01/a01_signup_screen.dart';
import '../../../../view_model/course/usermodel_controller.dart';
import '../user/user_repositories.dart';
import 'firebase_exceptionhandler.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get authUser => _auth.currentUser;

  UserController userController = Get.find();

  Future<UserCredential> registerWithEmailAndPassword(String email) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: "123456"
          //  DateTime.now().toString()
          );
    } catch (e) {
      throw ExceptionHandler.handleException(e);
    }
  }

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential auth = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserRepository userRepository = Get.find();
      final user = await userRepository.fetchUserdetails(auth.user!.uid);

      UserController userController = Get.find();
      userController.user(user);
      if (user.isOwner) {
        if (user.isRegistered) {
          Get.offAll(() => const MyBottomNavigationBar());
        } else {
          Get.offAll(() => A01SignupScreen());
        }
        return true;
      } else {
        // Handle error
        log("Some error happened");
        return false;
      }
    } catch (e) {
      throw ExceptionHandler.handleException(e);
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw ExceptionHandler.handleException(e);
    }
  }
}

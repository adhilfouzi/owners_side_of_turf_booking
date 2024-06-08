import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/backend/repositories/authentication/firebase_authentication.dart';
import '../../../utils/const/colors.dart';
import '../../../utils/const/image_name.dart';
import '../../../view_model/course/slot_request_controller.dart';
import '../../../view_model/course/transaction_controller.dart';
import '../../../view_model/course/usermodel_controller.dart';
import '../../../view_model/onboarding/signup/image_controller.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUserLoggedIn();
    Get.put(UserController());
    Get.put(SlotReservationController(), permanent: true);
    Get.put(TransactionController(), permanent: true);
  }

  @override
  Widget build(BuildContext context) {
    Get.put(ImageController());
    var height = MediaQuery.of(context).size.height * 0.2;
    return Scaffold(
      backgroundColor: CustomColor.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: height),
            Image.asset(ImagePath.logo),
            SizedBox(height: height),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> checkUserLoggedIn() async {
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final items = prefs.getStringList(logs);
    if (items == null) {
      await Future.delayed(const Duration(seconds: 2));
      Get.off(() => LoginScreen());
      log("LoginScreen");
    } else {
      await AuthenticationRepository()
          .signInWithEmailAndPassword(items[0], items[1]);
      log("signInWithEmailAndPassword");
    }
  } catch (e) {
    log('Error querying the database: $e');
  }
}

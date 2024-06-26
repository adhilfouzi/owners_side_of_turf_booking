import 'dart:developer';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/backend/repositories/authentication/firebase_authentication.dart';
import '../../utils/portion/snackbar.dart';
import '../../view/onboarding/boarding/login_screen.dart';

class ProfileController {
  static void changePassword(String email) async {
    try {
      await AuthenticationRepository().sendPasswordResetEmail(email);
      CustomSnackbar.showInfo("Password reset email sent successfully.");
    } catch (error) {
      CustomSnackbar.showError("Failed to send password reset email.");
    }
  }

  static void helpAndFAQs() async {
    const String emailAddress = 'adhilfouziofficial@gmail.com';
    const String emailSubject = 'Help_me';
    const String emailBody = 'Need_help';

    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: emailAddress,
      queryParameters: {
        'subject': emailSubject,
        'body': emailBody,
      },
    );
    try {
      await launchUrl(emailUri);
    } catch (e) {
      // print('Error launching email: $e');
    }
  }

  static void privacyPolicy() async {
    final Uri url = Uri.parse(
        'https://www.freeprivacypolicy.com/live/23a6eb84-0360-4ce5-8580-53a24494b3dc');

    try {
      await launchUrl(url);
    } catch (e) {
      CustomSnackbar.showError("Could not open privacy policy.");
    }
  }

  static void termsUse() async {
    final Uri url = Uri.parse(
        'https://www.freeprivacypolicy.com/live/cfe121cc-25c9-4882-a467-0f9bb8ab28da');
    try {
      await launchUrl(url);
    } catch (e) {
      CustomSnackbar.showError("Could not open terms of use.");
    }
  }

  static void logout() async {
    // Call the logout function from Firebase or any other authentication service
    try {
      await AuthenticationRepository().userLogout();
      Get.offAll(() => LoginScreen());
    } catch (e) {
      log("Error during logout: $e");
      CustomSnackbar.showError(
          "An error occurred during logout. Please try again.");
    }
  }
}

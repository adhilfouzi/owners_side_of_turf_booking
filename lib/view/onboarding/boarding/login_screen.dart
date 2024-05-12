import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/controller/validator.dart';
import '../../../utils/const/image_name.dart';
import '../../../utils/portion/button.dart';
import '../../../utils/portion/snackbar.dart';
import '../../../utils/portion/textfield.dart';
import '../../../view_model/onboarding/signin_controller/signincontroller.dart';
import 'account_request_screen.dart';

class LoginScreen extends StatelessWidget {
  final SigninController signinController =
      Get.put(SigninController()); // Instantiate the controller

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: signinController.loginKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: height * 0.3,
                  width: width,
                  child: Image.asset(logo),
                ),
                SizedBox(height: height * 0.05),
                MyTextField(
                  textInputAction: TextInputAction.next,
                  controller: signinController.emailTextEditingController,
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => InputValidators.validateEmail(value),
                ),
                PasswordTextField(
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  controller: signinController.passwordTextEditingController,
                ),
                SizedBox(height: height * 0.1),
                TextButton(
                  onPressed: () {
                    CustomSnackbar.showForgotPasswordDialog();
                  },
                  child: const Text("Forget password"),
                ),
                Button().mainButton('Log in', context, () {
                  signinController.signin();
                }),
                SizedBox(height: height * 0.1),
                TextButton(
                  onPressed: () {
                    Get.off(AccountRequestScreen());
                  },
                  child: const Text('Don’t have an account? '),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

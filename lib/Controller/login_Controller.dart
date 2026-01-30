import 'package:flutter/widgets.dart';
import 'package:fonify/Model/login_model.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  var isObscure = true.obs;

  // hard coded user (future backend yahin replace hoga)
  final UserModel hardUser = UserModel(
    email: "test@gmail.com",
    password: "132435",
  );

  // 🔹 Email / Password Login
  void login() {
    isLoading.value = true;

    if (emailController.text == hardUser.email &&
        passwordController.text == hardUser.password) {
      isLoading.value = false;
      Get.snackbar("Success", "Login Successful");
    } else {
      isLoading.value = false;
      Get.snackbar("Error", "Invalid Email or Password");
    }
  }

  // 🔹 Google Login (future)
  void loginWithGoogle() {
    Get.snackbar("Google", "Google login coming soon");
  }

  // 🔹 Facebook Login (future)
  void loginWithFacebook() {
    Get.snackbar("Facebook", "Facebook login coming soon");
  }

  // 🔹 Apple Login (future)
  void loginWithApple() {
    Get.snackbar("Apple", "Apple login coming soon");
  }
 

  // 🔹 Dispose controllers
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // To toggle between Login and Register forms
  var isLogin = true.obs;

  // Controllers for login inputs
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // Controllers for registration inputs
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Toggle between Login and Register forms
  void toggleLoginRegister() {
    isLogin.value = !isLogin.value;
  }


  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    emailController.dispose();
    registerPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLogin = true.obs;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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

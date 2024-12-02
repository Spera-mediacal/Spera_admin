import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spera_admin_panel/utils/colors.dart';
import 'package:spera_admin_panel/utils/global_widgets/custom_button.dart';
import 'package:spera_admin_panel/utils/global_widgets/custom_text_field.dart';
import 'package:spera_admin_panel/utils/global_widgets/logo_widget.dart';
import 'package:spera_admin_panel/utils/size_config.dart';
import '../../../controller/admin_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminController());

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/media/bg.png'),
          ),
        ),
        child: Obx(() {
          final containerWidth = screenWidth(context) > 1200
              ? screenWidth(context) * 0.3
              : screenWidth(context) * 0.8;

          final containerHeight = screenHeight(context) > 800
              ? screenHeight(context) * 0.7
              : screenHeight(context) * 0.9;

          return Container(
            width: containerWidth,
            height: containerHeight,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.accentColor.withOpacity(0.2),
                  spreadRadius: 15,
                  blurRadius: 10,
                  offset: const Offset(0, 10),
                ),
              ],
              color: AppColors.greyColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const LogoWidget(width: 100, height: 100),
                (screenHeight(context) * 0.04).sh,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => controller.isLogin.value = true,
                      child: Text(
                        'login'.tr,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: controller.isLogin.value
                              ? AppColors.accentColor
                              : Colors.grey,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => controller.isLogin.value = false,
                      child: Text(
                        'register'.tr,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: !controller.isLogin.value
                              ? AppColors.accentColor
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: AppColors.accentColor,
                  thickness: 1,
                ),
                Expanded(
                  child: controller.isLogin.value
                      ? _buildLoginForm(controller, context)
                      : _buildRegisterForm(controller, context),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildLoginForm(AdminController controller, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextField(
          hintText: 'username'.tr,
          prefixIcon: HugeIcons.strokeRoundedUser,
          width: screenWidth(context) > 1200
              ? screenWidth(context) * 0.25
              : screenWidth(context) * 0.7,
          controller: controller.loginUsernameController,
        ),
        CustomTextField(
          hintText: 'password'.tr,
          prefixIcon: HugeIcons.strokeRoundedLockComputer,
          isPassword: true,
          obscureText: true,
          width: screenWidth(context) > 1200
              ? screenWidth(context) * 0.25
              : screenWidth(context) * 0.7,
          controller: controller.loginPasswordController,
        ),
        (screenHeight(context) * 0.04).sh,
        Obx(() {
          return controller.isLoading.value
              ? const CircularProgressIndicator()
              : CustomButton(
            text: 'login'.tr,
            onTap: () {
              controller.login();
            },
            width: screenWidth(context) > 1200
                ? screenWidth(context) * 0.25
                : screenWidth(context) * 0.7,
            height: screenHeight(context) * 0.07,
          );
        }),


      ],
    );
  }

  Widget _buildRegisterForm(AdminController controller, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextField(
          hintText: 'fullName'.tr,
          prefixIcon: HugeIcons.strokeRoundedUserGroup,
          width: screenWidth(context) > 1200
              ? screenWidth(context) * 0.25
              : screenWidth(context) * 0.7,
          controller: controller.fullNameController,
        ),
        CustomTextField(
          hintText: 'email'.tr,
          prefixIcon: HugeIcons.strokeRoundedMail01,
          width: screenWidth(context) > 1200
              ? screenWidth(context) * 0.25
              : screenWidth(context) * 0.7,
          controller: controller.usernameController,
        ),
        CustomTextField(
          hintText: 'password'.tr,
          prefixIcon: HugeIcons.strokeRoundedLockComputer,
          isPassword: true,
          obscureText: true,
          width: screenWidth(context) > 1200
              ? screenWidth(context) * 0.25
              : screenWidth(context) * 0.7,
          controller: controller.registerPasswordController,
        ),
        CustomTextField(
          hintText: 'confirmPassword'.tr,
          prefixIcon: HugeIcons.strokeRoundedLockComputer,
          isPassword: true,
          obscureText: true,
          width: screenWidth(context) > 1200
              ? screenWidth(context) * 0.25
              : screenWidth(context) * 0.7,
          controller: controller.confirmPasswordController,
        ),
        (screenHeight(context) * 0.04).sh,
        Obx(() {
          return controller.isLoading.value
              ? const CircularProgressIndicator()
              : CustomButton(
            text: 'register'.tr,
            onTap: () {
              controller.register();
            },
            width: screenWidth(context) > 1200
                ? screenWidth(context) * 0.25
                : screenWidth(context) * 0.7,
            height: screenHeight(context) * 0.07,
          );
        }),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spera_admin_panel/app/model/user_model.dart';
import 'package:spera_admin_panel/app/views/users_view/components/user_overview_cart.dart';
import 'package:spera_admin_panel/utils/text_styles.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/global_widgets/custom_appbar.dart';
import '../../../../utils/global_widgets/glass_container.dart';
import '../../../../utils/size_config.dart';
import '../../../controller/user_controller.dart';

class UsersView extends StatelessWidget {
  UsersView({super.key});

  final UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context),
      height: screenHeight(context),
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: AppColors.blackColor,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            title: 'users'.tr,
          ),
          Text(
            "${controller.users.length} ${'usersFound'.tr}",
            style: AppTextStyles.textStyle24,
          ),
          (screenHeight(context) * 0.04).sh,
          Text(
            'allUsers'.tr,
            style:
                AppTextStyles.textStyle35.copyWith(fontWeight: FontWeight.bold),
          ),
          (screenHeight(context) * 0.04).sh,
          Row(
            children: [
              const Spacer(
                flex: 5,
              ),
              Text(
                'ID',
                style: AppTextStyles.textStyle24
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(
                flex: 9,
              ),
              Text(
                'name'.tr,
                style: AppTextStyles.textStyle24
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(
                flex: 9,
              ),
              Text(
                'phone'.tr,
                style: AppTextStyles.textStyle24
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(
                flex: 8,
              ),
              Text(
                'blood'.tr,
                style: AppTextStyles.textStyle24
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(
                flex: 9,
              ),
              Text(
                'points'.tr,
                style: AppTextStyles.textStyle24
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(
                flex: 9,
              ),
              Text(
                'height'.tr,
                style: AppTextStyles.textStyle24
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(
                flex: 5,
              )
            ],
          ),
          (screenHeight(context) * 0.02).sh,
          Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            return Expanded(
              child: ListView.builder(
                  itemCount: controller.users.length,
                  itemBuilder: (context, index) {
                    final User user = controller.users[index];
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              backgroundColor: Colors.transparent,
                              contentPadding: EdgeInsets.zero,
                              content: GlassContainer(
                                verticalPadding: 20,
                                horizontalPadding: 20,
                                height: screenHeight(context) * 0.7,
                                width: screenWidth(context) * 0.8,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Header with Title and Close Button
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'user_details'.tr,
                                          style: AppTextStyles.textStyle24
                                              .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.accentColor,
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.close,
                                              color: AppColors.accentColor),
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                        ),
                                      ],
                                    ),

                                    // Divider
                                    Divider(
                                        color: AppColors.accentColor
                                            .withOpacity(0.3)),

                                    // User Details
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            _buildDetailRow('ID', user.id),
                                            _buildDetailRow(
                                                'name'.tr, user.name ?? 'N/A'),
                                            _buildDetailRow('bloodType'.tr,
                                                user.bloodType ?? 'N/A'),
                                            _buildDetailRow('phone'.tr,
                                                user.phone ?? 'N/A'),
                                            _buildDetailRow('age'.tr,
                                                user.age.toString() ?? 'N/A'),
                                            // Add more fields as needed based on your User model
                                          ],
                                        ),
                                      ),
                                    ),

                                    // Divider
                                    Divider(
                                        color: AppColors.accentColor
                                            .withOpacity(0.3)),

                                    // Action Buttons
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton.icon(
                                          icon: const Icon(Icons.delete_outline,
                                              color: Colors.white),
                                          label: Text('delete'.tr),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                            foregroundColor: Colors.white,
                                          ),
                                          onPressed: () {
                                            // Show confirmation dialog before deletion
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title:
                                                    Text('confirm_deletion'.tr),
                                                content: Text(
                                                    'delete_user_confirm'.tr),
                                                actions: [
                                                  TextButton(
                                                    child: Text('cancel'.tr),
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .pop(),
                                                  ),
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Colors.red,
                                                    ),
                                                    child: Text(
                                                      'delete'.tr,
                                                      style: AppTextStyles
                                                          .textStyle15,
                                                    ),
                                                    onPressed: () {
                                                      Get.back();
                                                      Get.back();

                                                      controller
                                                          .deleteUser(user.id);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: UserOverviewCart(user: user),
                    );
                  }),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '$label:',
              style: AppTextStyles.textStyle15.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.accentColor,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: AppTextStyles.textStyle15.copyWith(
                color: AppColors.accentColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

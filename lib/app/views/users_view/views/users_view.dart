import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spera_admin_panel/app/model/user_model.dart';
import 'package:spera_admin_panel/app/views/users_view/components/user_overview_cart.dart';
import 'package:spera_admin_panel/utils/text_styles.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/global_widgets/custom_appbar.dart';
import '../../../../utils/size_config.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

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
            "${500} ${'usersFound'.tr}",
            style: AppTextStyles.textStyle24,
          ),
          (screenHeight(context) * 0.04).sh,
          Text(
            'allUsers'.tr,
            style: AppTextStyles.textStyle35
                .copyWith(fontWeight: FontWeight.bold),
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
                'age'.tr,
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
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => UserOverviewCart(
                user: User(
                  fullName: 'Full Name',
                  id: 'id',
                  phoneNumber: 'Phone Number',
                  bloodType: 'Blood Type',
                  weight: 100,
                  height: 100,
                  age: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

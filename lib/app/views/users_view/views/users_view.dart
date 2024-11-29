import 'package:flutter/material.dart';
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
      decoration: const BoxDecoration(
        color: AppColors.blackColor,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(
              title: 'Users',
            ),
              Text(
              '5000 Users found',
              style: AppTextStyles.textStyle24,
            ),
            (screenHeight(context) * 0.04).sh,
            Text(
              'All Users',
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
                  'Name',
                  style: AppTextStyles.textStyle24
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const Spacer(
                  flex: 9,
                ),
                Text(
                  'Phone',
                  style: AppTextStyles.textStyle24
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const Spacer(
                  flex: 8,
                ),
                Text(
                  'Blood',
                  style: AppTextStyles.textStyle24
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const Spacer(
                  flex: 9,
                ),
                Text(
                  'Age',
                  style: AppTextStyles.textStyle24
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const Spacer(
                  flex: 9,
                ),
                Text(
                  'Height',
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
                    fullName: 'fullName',
                    id: 'id',
                    phoneNumber: 'phoneNumber',
                    bloodType: 'bloodType',
                    weight: 100,
                    height: 100,
                    age: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

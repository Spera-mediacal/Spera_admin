import 'package:flutter/material.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'ID',
                  style: AppTextStyles.textStyle24
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Name',
                  style: AppTextStyles.textStyle24
                      .copyWith(fontWeight: FontWeight.bold),
                ),

                Text(
                  'Address',
                  style: AppTextStyles.textStyle24
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Donation',
                  style: AppTextStyles.textStyle24
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Points',
                  style: AppTextStyles.textStyle24
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Date',
                  style: AppTextStyles.textStyle24
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            (screenHeight(context) * 0.02).sh,
            Expanded(
                child: ListView.builder(
                  itemCount: 10,
              itemBuilder: (context, index) => const UserOverviewCart(
                id: '00001',
                address: 'Qubaa City',
                data: '20/10/2005',
                donation: 8,
              ),
            ))
          ],
        ),
      ),
    );
  }
}

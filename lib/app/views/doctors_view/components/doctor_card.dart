import 'package:flutter/material.dart';
import 'package:spera_admin_panel/app/model/doctor_model.dart';
import 'package:spera_admin_panel/app/model/user_model.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.doctor,
  });

  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: screenWidth(context),
      height: screenHeight(context) * 0.08,
      decoration: BoxDecoration(
        color: AppColors.accentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Spacer(
            flex: 4,
          ),
          Text(
            '#${doctor.id}',
            style: AppTextStyles.textStyle19.copyWith(
                color: AppColors.blackColor, fontWeight: FontWeight.w400),
          ),
          const Spacer(
            flex: 8,
          ),
          SizedBox(
            width: 140,
            child: Text(
              doctor.name,
              style: AppTextStyles.textStyle19.copyWith(
                  overflow: TextOverflow.ellipsis,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w400),
            ),
          ),
          const Spacer(
            flex: 7,
          ),
          Text(
            doctor.phone,
            style: AppTextStyles.textStyle19.copyWith(
                color: AppColors.blackColor, fontWeight: FontWeight.w400),
          ),
          const Spacer(
            flex: 10,
          ),
          Text(
            doctor.address,
            style: AppTextStyles.textStyle19.copyWith(
                color: AppColors.blackColor, fontWeight: FontWeight.bold),
          ),
          const Spacer(
            flex: 10,
          ),
          Text(
            doctor.specialization,
            style: AppTextStyles.textStyle19.copyWith(
                color: AppColors.blackColor, fontWeight: FontWeight.bold),
          ),
          const Spacer(
            flex: 9,
          ),
          Text(
            '${doctor.rate}',
            style: AppTextStyles.textStyle15.copyWith(
                color: AppColors.blackColor, fontWeight: FontWeight.bold),
          ),
          const Spacer(
            flex: 4,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spera_admin_panel/utils/global_widgets/custom_appbar.dart';
import 'package:spera_admin_panel/utils/global_widgets/glass_container.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';
import '../../../controller/doctor_controller.dart';
import '../components/add_doctor_section.dart';
import '../components/doctor_card.dart';

class DoctorsView extends StatelessWidget {
  final DoctorController controller = Get.put(DoctorController());

  DoctorsView({super.key});

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
      child: SingleChildScrollView(
        child: Column(
          children: [
             CustomAppBar(title: 'doctors'.tr),
            AddDoctorSection(controller: controller),
            (screenHeight(context) * 0.02).sh,
            Obx(() {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.doctors.length,
                itemBuilder: (context, index) {
                  final doctor = controller.doctors[index];
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            backgroundColor: Colors.transparent,
                            title: const Text('Doctor Details'),
                            content: GlassContainer(
                              verticalPadding: 10,
                              horizontalPadding: 10,
                              height: screenHeight(context) * 0.6,
                              width: screenWidth(context) * 0.3,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ID: ${doctor.id}',
                                    style: AppTextStyles.textStyle19
                                        .copyWith(color: AppColors.accentColor),
                                  ),
                                  Text(
                                    '${'name'.tr}: ${doctor.name}',
                                    style: AppTextStyles.textStyle19
                                        .copyWith(color: AppColors.accentColor),
                                  ),
                                  Text(
                                    '${'phone'.tr}: ${doctor.phone}',
                                    style: AppTextStyles.textStyle19
                                        .copyWith(color: AppColors.accentColor),
                                  ),
                                  Text(
                                    '${'address'.tr}: ${doctor.address}',
                                    style: AppTextStyles.textStyle19
                                        .copyWith(color: AppColors.accentColor),
                                  ),
                                  Text(
                                    '${'Specialization'.tr}: ${doctor.specialization}',
                                    style: AppTextStyles.textStyle19
                                        .copyWith(color: AppColors.accentColor),
                                  ),
                                  Text(
                                    '${'rate'.tr}: ${doctor.rate}',
                                    style: AppTextStyles.textStyle19
                                        .copyWith(color: AppColors.accentColor),
                                  ),
                                  Text(
                                    '${'workingDays'.tr}: ${doctor.workDays.join(', ')}',
                                    style: AppTextStyles.textStyle19
                                        .copyWith(color: AppColors.accentColor),
                                  ),
                                  Text(
                                    '${'from'.tr}: ${doctor.startHour}',
                                    style: AppTextStyles.textStyle19
                                        .copyWith(color: AppColors.accentColor),
                                  ),Text(
                                    '${'to'.tr}: ${doctor.endHour}',
                                    style: AppTextStyles.textStyle19
                                        .copyWith(color: AppColors.accentColor),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: DoctorCard(doctor: doctor),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

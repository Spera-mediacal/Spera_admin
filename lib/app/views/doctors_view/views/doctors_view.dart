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
      child: Column(
        children: [
          CustomAppBar(title: 'doctors'.tr),
          AddDoctorSection(controller: controller),
          (screenHeight(context) * 0.02).sh,
          Obx(() {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.doctorsList.length,
              itemBuilder: (context, index) {
                final doctor = controller.doctorsList[index];
                print(doctor.id);
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
                            height: screenHeight(context) * 0.5,
                            width: screenWidth(context) * 0.8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'doctor_details'.tr,
                                      style: AppTextStyles.textStyle24.copyWith(
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
                                Divider(
                                    color:
                                        AppColors.accentColor.withOpacity(0.3)),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        buildDetailRow(
                                            'ID', doctor.id.toString()),
                                        buildDetailRow('name'.tr, doctor.name),
                                        buildDetailRow(
                                            'phone'.tr, doctor.phone),
                                        buildDetailRow(
                                            'address'.tr, doctor.address),
                                        buildDetailRow('specialization'.tr,
                                            doctor.specialization),
                                        buildDetailRow(
                                            'rate'.tr, doctor.rate.toString()),
                                        buildDetailRow('workingDays'.tr,
                                            doctor.workDays.join(', ')),
                                        buildDetailRow(
                                            'from'.tr, doctor.startHour),
                                        buildDetailRow(
                                            'to'.tr, doctor.endHour),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                    color:
                                        AppColors.accentColor.withOpacity(0.3)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text('confirm_deletion'.tr),
                                            content: Text(
                                                'delete_doctor_confirm'.tr),
                                            actions: [
                                              TextButton(
                                                child: Text('cancel'.tr),
                                                onPressed: () =>
                                                    Navigator.of(context).pop(),
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.red,
                                                ),
                                                child: Text(
                                                  'delete'.tr,
                                                  style:
                                                      AppTextStyles.textStyle19,
                                                ),
                                                onPressed: () {
                                                  Get.back();
                                                  Get.back();
                                                  controller.deleteDoctor(
                                                      doctor.id.toString());
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
                  child: DoctorCard(doctor: doctor),
                );
              },
            );
          }),
        ],
      ),
    );
  }

  Widget buildDetailRow(String label, String value) {
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

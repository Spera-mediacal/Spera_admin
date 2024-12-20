import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:spera_admin_panel/utils/global_widgets/custom_appbar.dart';
import 'package:spera_admin_panel/utils/global_widgets/custom_button.dart';
import 'package:spera_admin_panel/utils/global_widgets/custom_text_field.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../controller/blood_staff_controller.dart';
import '../components/blood_record_container.dart';
import '../components/blood_type_bar_chart.dart';

class BloodStaffView extends StatelessWidget {
  BloodStaffView({super.key});

  final DonateController controller = Get.put(DonateController());

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
            CustomAppBar(title: 'bloodStaff'.tr),
            Row(
              children: [
                Expanded(
                  child: Obx(() => BloodRecordContainer(
                    icon: HugeIcons.strokeRoundedEye,
                    percent: calculatePercentage(
                        controller.yearlyDonations.value, "year"),
                    title: 'yearlyDonations'.tr,
                    value: controller.yearlyDonations.value,
                  )),
                ),
                Expanded(
                  child: Obx(() => BloodRecordContainer(
                    icon: HugeIcons.strokeRoundedEye,
                    percent: calculatePercentage(
                        controller.monthlyDonations.value, "month"),
                    title: 'monthlyDonations'.tr,
                    value: controller.monthlyDonations.value,
                  )),
                ),
                Expanded(
                  child: Obx(() => BloodRecordContainer(
                    icon: HugeIcons.strokeRoundedEye,
                    percent: calculatePercentage(
                        controller.weeklyDonations.value, "week"),
                    title: 'weeklyDonations'.tr,
                    value: controller.weeklyDonations.value,
                  )),
                ),
                Expanded(
                  child: Obx(() => BloodRecordContainer(
                    icon: HugeIcons.strokeRoundedEye,
                    percent: calculatePercentage(
                        controller.dailyDonations.value, "day"),
                    title: 'dailyDonations'.tr,
                    value: controller.dailyDonations.value,
                  )),
                ),
              ],
            ),
            SizedBox(height: screenHeight(context) * 0.02),
            Row(
              children: [
                // Blood Type Distribution Chart
                SizedBox(
                  height: screenHeight(context) * 0.7,
                  width: screenWidth(context) * 0.45,
                  child: Obx(() {
                    return BloodLinesChart(
                      aPos: controller.bloodTypeCounts['A+'] ?? 0,
                      aNeg: controller.bloodTypeCounts['A-'] ?? 0,
                      bPos: controller.bloodTypeCounts['B+'] ?? 0,
                      bNeg: controller.bloodTypeCounts['B-'] ?? 0,
                      oPos: controller.bloodTypeCounts['O+'] ?? 0,
                      oNeg: controller.bloodTypeCounts['O-'] ?? 0,
                      abPos: controller.bloodTypeCounts['AB+'] ?? 0,
                      abNeg: controller.bloodTypeCounts['AB-'] ?? 0,
                    );
                  }),
                ),
                const Spacer(),
                // QR Code and Input Fields
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(() {
                      if (controller.qrData.value == '') {
                        return const Icon(
                          HugeIcons.strokeRoundedQrCode,
                          size: 210,
                          color: AppColors.accentColor,
                        );
                      } else {
                        return Container(
                          alignment: Alignment.center,
                          height: screenHeight(context) * 0.18,
                          width: screenWidth(context) * 0.18,
                          child: PrettyQrView.data(
                            data: controller.qrData.value,
                            errorCorrectLevel: QrErrorCorrectLevel.H,
                            decoration: const PrettyQrDecoration(
                              shape: PrettyQrRoundedSymbol(
                                  color: AppColors.accentColor,
                                  borderRadius: BorderRadius.all(Radius.zero)),
                              background: AppColors.blackColor,
                              image: PrettyQrDecorationImage(
                                image: AssetImage('assets/media/logo.png'),
                              ),
                            ),
                          ),
                        );
                      }
                    }),
                    SizedBox(height: screenHeight(context) * 0.02),
                    CustomTextField(
                      hintText: 'stationAddress'.tr,
                      height: screenHeight(context) * 0.02,
                      width: screenWidth(context) * 0.2,
                      controller: controller.stationAddress,
                    ),
                    CustomTextField(
                      hintText: 'examinerName'.tr,
                      height: screenHeight(context) * 0.02,
                      width: screenWidth(context) * 0.2,
                      controller: controller.examinerName,
                    ),
                    CustomTextField(
                      hintText: 'quantity'.tr,
                      height: screenHeight(context) * 0.02,
                      width: screenWidth(context) * 0.2,
                      controller: controller.quantity,
                    ),
                    CustomTextField(
                      hintText: 'bloodType'.tr,
                      height: screenHeight(context) * 0.02,
                      width: screenWidth(context) * 0.2,
                      controller: controller.bloodType,
                    ),
                    SizedBox(height: screenHeight(context) * 0.02),
                    CustomButton(
                      text: 'generate'.tr,
                      onTap: () {
                        controller.generateQRCode();
                      },
                      width: screenWidth(context) * 0.2,
                      height: screenHeight(context) * 0.06,
                      borderRadius: 12,
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  int calculatePercentage(int value, String period) {
    // Adjust the calculation logic as per your requirement
    int maxValue = period == "year"
        ? 3650
        : period == "month"
        ? 300
        : period == "week"
        ? 70
        : 10; // Example max values
    return ((value / maxValue) * 100).toInt();
  }
}

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

  final BloodStaffController controller = Get.put(BloodStaffController());

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
                    percent: 20,
                    title: 'yearlyDonations'.tr,
                    value: controller.yearlyDonations.value,
                  )),
                ),
                Expanded(
                  child: Obx(() => BloodRecordContainer(
                    icon: HugeIcons.strokeRoundedEye,
                    percent: 20,
                    title: 'monthlyDonations'.tr,
                    value: controller.monthlyDonations.value,
                  )),
                ),
                Expanded(
                  child: Obx(() => BloodRecordContainer(
                    icon: HugeIcons.strokeRoundedEye,
                    percent: 20,
                    title: 'weeklyDonations'.tr,
                    value: controller.weeklyDonations.value,
                  )),
                ),
                Expanded(
                  child: Obx(() => BloodRecordContainer(
                    icon: HugeIcons.strokeRoundedEye,
                    percent: 20,
                    title: 'dailyDonations'.tr,
                    value: controller.dailyDonations.value,
                  )),
                ),
              ],
            ),
            (screenHeight(context) * 0.02).sh,
            Row(
              children: [
                SizedBox(
                  height: screenHeight(context) * 0.7,
                  width: screenWidth(context) * 0.45,
                  //each quantity of blood type
                  child: const BloodLinesChart(
                    aPos: 3,
                    aNeg: 6,
                    bPos: 7,
                    bNeg: 9,
                    oPos: 10,
                    oNeg: 5,
                    abPos: 15,
                    abNeg: 18,
                  ),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                      () {
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
                                    borderRadius:
                                        BorderRadius.all(Radius.zero)),
                                background: AppColors.blackColor,
                                image: PrettyQrDecorationImage(
                                  image: AssetImage('assets/media/logo.png'),
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    (screenHeight(context) * 0.02).sh,
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
                    (screenHeight(context) * 0.02).sh,
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
}

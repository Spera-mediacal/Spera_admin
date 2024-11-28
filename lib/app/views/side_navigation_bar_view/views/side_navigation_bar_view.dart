import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spera_admin_panel/utils/global_widgets/logo_widget.dart';
import 'package:spera_admin_panel/utils/size_config.dart';
import 'package:spera_admin_panel/utils/text_styles.dart';
import '../../../../utils/colors.dart';
import '../../../controller/side_nav_controller.dart';

class SideNavigationBarView extends StatelessWidget {
  SideNavigationBarView({super.key});

  final SideNavController controller = Get.put(SideNavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth(context) * 0.01,
              vertical: screenHeight(context) * 0.04,
            ),
            child: Column(
              children: [
                const LogoWidget(width: 80, height: 80),
                (screenHeight(context) * 0.04).sh,
                Expanded(
                  child: SizedBox(
                    width: screenWidth(context) * 0.15,
                    child: ListView.builder(
                      itemCount: controller.pageTitles.length,
                      itemBuilder: (context, index) {
                        return Obx(() {
                          bool isSelected =
                              controller.selectedIndex.value == index;
                          return GestureDetector(
                            onTap: () => controller.changePage(index),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.whiteColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: isSelected
                                    ? [
                                        BoxShadow(
                                          color: AppColors.blackColor
                                              .withOpacity(0.1),
                                          blurRadius: 10,
                                          offset: const Offset(0, 4),
                                        )
                                      ]
                                    : [],
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    controller.pageIcons[index],
                                    color: isSelected
                                        ? AppColors.blackColor
                                        : AppColors.accentColor,
                                    size: 24,
                                  ),
                                  SizedBox(width: screenWidth(context) * 0.02),
                                  Text(
                                    controller.pageTitles[index],
                                    style: AppTextStyles.textStyle19.copyWith(
                                      color: isSelected
                                          ? AppColors.blackColor
                                          : AppColors.accentColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.accentColor.withOpacity(0.3),
                      AppColors.accentColor.withOpacity(0.7),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(20),
                  ),
                ),
                child: IndexedStack(
                  index: controller.selectedIndex.value,
                  children: controller.pageViews, // List of page views
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

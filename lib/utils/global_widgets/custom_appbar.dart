import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../colors.dart';
import '../size_config.dart';
import '../text_styles.dart';
import 'custom_text_field.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
          SizedBox(
            width: 200,
            child: Text(
              title,
              style:
                  AppTextStyles.textStyle40.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(
            flex: 20,
          ),
          CustomTextField(
            hintText: 'Search',
            width: screenWidth(context) * 0.3,
          ),
          const Spacer(flex: 6),
          const Icon(
            Icons.notifications,
            color: AppColors.accentColor,
          ),
          const Spacer(flex: 6),
          const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRa-zrKvWcBozPRvgPMHEm2fAgITc48lVqzSg&s'),
          ),
          const Spacer(
            flex: 1,
          ),
          const Text(
            'Steven Nullman',
            style: AppTextStyles.textStyle19,
          ),
          const Spacer(
            flex: 1,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              HugeIcons.strokeRoundedArrowDown01,
              color: AppColors.accentColor,
            ),
          ),
        ],
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../colors.dart';
import '../size_config.dart';
import '../text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, required this.onTap});

  final String title;
  final Function() onTap;

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Padding(
        padding: EdgeInsets.only(
          top: screenHeight(context) * 0.03,
        ),
        child: Text(
          title,
          style: AppTextStyles.textStyle40,
        ),
      ),
      leading: Padding(
        padding: EdgeInsets.only(
          top: screenHeight(context) * 0.02,
          left: screenWidth(context) * 0.07,
        ),
        child: IconButton(
          onPressed: onTap,
          icon: const Icon(
            HugeIcons.strokeRoundedArrowLeft01,
            size: 30,
            color: AppColors.accentColor,
          ),
        ),
      ),
    );
  }
}
*/

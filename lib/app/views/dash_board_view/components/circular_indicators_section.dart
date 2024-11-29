import 'package:flutter/material.dart';
import 'package:spera_admin_panel/app/views/dash_board_view/components/progress_item.dart';

class CircularIndicatorsSection extends StatelessWidget {
  const CircularIndicatorsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ProgressItem(
          footer: 'Users Between 18 and 25',
          percentage: 15,
        ), ProgressItem(
          footer: 'Users Between 25 and 50',
          percentage: 80,
        ), ProgressItem(
          footer: 'Users Above 50',
          percentage: 5,
        ),
      ],
    );
  }
}

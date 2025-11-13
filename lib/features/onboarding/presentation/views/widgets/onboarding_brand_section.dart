import 'package:dalel_elsham/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/colors_manager.dart';


class OnboardingBrandSection extends StatelessWidget {
  OnboardingBrandSection({super.key, required this.text , this.logoShow = true});
  String? text;
  bool ? logoShow ;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 100,
      left: 20,
      right: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
           if(logoShow!)
           Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(60),
            ),
            child: Image.asset(
              AssetsManager.onboarding1,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            text!,
            style: AppTextStyles.bold32.copyWith(color: ColorsManager.white),
          ),
        ],
      ),
    );
  }
}

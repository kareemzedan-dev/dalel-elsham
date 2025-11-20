import 'package:dalel_elsham/core/cache/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes/routes_manager.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/colors_manager.dart';
import 'onboarding_indicator.dart';

class OnboardingHeader extends StatelessWidget {
  OnboardingHeader({
    super.key,
    required this.containerColor,
    required this.currentPage,
    required this.controller,
  });

  final Color? containerColor;
  final int currentPage;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: containerColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Indicators
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: List.generate(
                      4,
                      (index) => OnboardingIndicator(
                        index: index,
                        currentIndex: currentPage,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                /// Skip - Next row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// تخطي
                      GestureDetector(
                        onTap: () {
                          SharedPrefHelper.setBool("onboarding_skipped", true);
                          Navigator.pushReplacementNamed(
                            context,
                            RoutesManager.home,
                          );
                        },
                        child: Text(
                          "تخطي",
                          style: AppTextStyles.bold20.copyWith(
                            color: ColorsManager.white,
                          ),
                        ),
                      ),

                      /// التالي أو هيا بنا
                      GestureDetector(
                        onTap: () {
                          if (currentPage == 3) {
                            SharedPrefHelper.setBool("onboarding_skipped", true);
                            Navigator.pushReplacementNamed(
                              context,
                              RoutesManager.home,
                            );
                          } else {
                            controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        child: Row(
                          children: [
                            Text(
                              currentPage == 3 ? "هيا بنا" : "التالي",
                              style: AppTextStyles.bold20.copyWith(
                                color: ColorsManager.white,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: ColorsManager.white,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

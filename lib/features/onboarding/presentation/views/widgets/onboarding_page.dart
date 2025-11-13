import 'package:flutter/material.dart';

import 'bottom_gradient_overlay.dart';
import 'onboarding_brand_section.dart';
import 'onboarding_header.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.currentPage,
    required this.image,
    required this.controller,
  });

  final int currentPage;
  final String image;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
        ),

        OnboardingHeader(
          containerColor: Colors.black.withOpacity(0.3),
          currentPage: currentPage,
          controller: controller,
        ),

        BottomGradientOverlay(),
      ],
    );
  }
}

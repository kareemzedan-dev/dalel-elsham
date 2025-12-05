import 'package:flutter/material.dart';

import '../../../../../core/utils/colors_manager.dart';

class OnboardingIndicator extends StatelessWidget {
  final int index;
  final int currentIndex;

  const OnboardingIndicator({
    super.key,
    required this.index,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    bool isActive = index <= currentIndex;
return Expanded(
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? ColorsManager.primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  ),
);

  }
}

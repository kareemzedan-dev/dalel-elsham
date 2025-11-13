import 'package:flutter/material.dart';

import '../../../../../core/utils/assets_manager.dart';
import 'onboarding_page.dart';


class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}
 
class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  
  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {

    return PageView(
      controller: _pageController,
      onPageChanged: (value) {
        setState(() {
          _currentPage = value;
        });
        print(_currentPage);
      },

      children: [
        OnboardingPage(
          currentPage: _currentPage,
          controller: _pageController,

          image: AssetsManager.onboarding1,
          
        ),
        OnboardingPage(
          currentPage: _currentPage,
          controller: _pageController,

          image: AssetsManager.onboarding2,

        ),
        OnboardingPage(
          currentPage: _currentPage,
          controller: _pageController,

          image: AssetsManager.onboarding3,

        ),
        OnboardingPage(
          currentPage: _currentPage,
          controller: _pageController,

          image: AssetsManager.onboarding4,
        ),
      ],
    );
  }
}

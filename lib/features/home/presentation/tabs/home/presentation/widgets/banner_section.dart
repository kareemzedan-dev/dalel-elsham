import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/utils/colors_manager.dart';

class BannerSection extends StatefulWidget {
  const BannerSection({
    super.key,
    required this.images,
    this.showDotsOnTop = false,
  });

  final List<String> images;
  final bool showDotsOnTop;

  @override
  State<BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return widget.showDotsOnTop
        ? _buildStackedCarousel()
        : _buildColumnCarousel();
  }

  Widget _buildColumnCarousel() {
    return Column(
      children: [
        _buildCarousel(),
        SizedBox(height: 8.h),
        _buildDotsIndicator(),
      ],
    );
  }

  Widget _buildStackedCarousel() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        _buildCarousel(),
        Positioned(
          bottom: 12.h,
          child: _buildDotsIndicator(),
        ),
      ],
    );
  }

  Widget _buildCarousel() {
    return CarouselSlider.builder(
      itemCount: widget.images.length,
      itemBuilder: (context, index, realIndex) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              widget.images[index],
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 200.h,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.easeInOut,
        viewportFraction: 1.0,
        enlargeCenterPage: false,
        onPageChanged: (index, reason) => setState(() => _currentIndex = index),
      ),
    );
  }

  Widget _buildDotsIndicator() {
    return DotsIndicator(
      dotsCount: widget.images.length,
      position: _currentIndex.toDouble(),
      decorator: DotsDecorator(
        activeColor: ColorsManager.primaryColor,
        color: Colors.grey.shade400,
        size: const Size(8, 8),
        activeSize: const Size(12, 12),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}

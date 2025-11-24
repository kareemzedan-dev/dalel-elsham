import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../config/routes/routes_manager.dart';
import '../../../../../../../core/services/open_url_service.dart';
import '../../../../../../../core/utils/colors_manager.dart';
import '../../domain/entities/banner_entity.dart';
class BannerSection extends StatefulWidget {
  const BannerSection({
    super.key,
    required this.images,
    this.showDotsOnTop = false,
    this.disableAutoPlay = false,

  });

  final List<BannerEntity> images;
  final bool showDotsOnTop;
  final bool disableAutoPlay;



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
        Positioned(bottom: 12.h, child: _buildDotsIndicator()),
      ],
    );
  }

  Widget _buildCarousel() {
    return CarouselSlider.builder(
      itemCount: widget.images.length,
      itemBuilder: (context, index, realIndex) {
        final banner = widget.images[index];

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: GestureDetector(
              onTap: () {
                if (banner.type == "external") {
                  openUrl(banner.link!);
                } else if (banner.type == "internal") {
                  Navigator.pushNamed(
                    context,
                    RoutesManager.projectDetails,
                    arguments: {"projectId": banner.projectId},
                  );
                }
              },
              child: CachedNetworkImage(
                imageUrl: banner.imageUrl,
                fit: BoxFit.fill,
                width: double.infinity,

                placeholder: (_, __) => Container(
                  color: Colors.black12,
                ),

                errorWidget: (_, __, ___) => Container(
                  color: Colors.black12,
                  child: Icon(Icons.error, color: Colors.red),
                ),
              ),
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 200.h,
        autoPlay: !widget.disableAutoPlay,
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
      dotsCount: widget.images.length > 0 ? widget.images.length : 1,
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

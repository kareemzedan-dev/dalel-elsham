import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/components/project_fullscreen_gallery.dart';
import '../../../../../../../core/utils/assets_manager.dart';
import '../../../../../../../core/utils/colors_manager.dart';
class ProjectDetailsGallery extends StatelessWidget {
  final List<String> images;

  const ProjectDetailsGallery({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "الصور :",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),

        Wrap(
          spacing: 10.w,
          runSpacing: 10.h,
          children: List.generate(images.length, (index) {
            final image = images[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProjectFullScreenGallery(
                      images: images,
                      initialIndex: index,
                    ),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.network(
                  image,
                  height: 110.h,
                  width: 110.w,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}

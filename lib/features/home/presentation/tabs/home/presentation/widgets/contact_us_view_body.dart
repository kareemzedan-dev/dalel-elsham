import 'package:dalel_elsham/core/services/phone_call_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/services/contact_launcher_service.dart';
import '../../../../../../../core/services/open_url_service.dart';
import '../../../../../../../core/utils/assets_manager.dart';
import '../../../../../../../core/utils/colors_manager.dart';
import '../manager/app_links/get_all_app_links_view_model/get_all_app_links_view_model.dart';
import '../manager/app_links/get_all_app_links_view_model/get_all_app_links_view_model_states.dart';

class ContactUsViewBody extends StatelessWidget {
  const ContactUsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllAppLinksViewModel, GetAllAppLinksViewModelStates>(
      builder: (context, state) {
        if (state is GetAllAppLinksViewModelStatesLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is GetAllAppLinksViewModelStatesError) {
          return Center(child: Text(state.message));
        }

        if (state is GetAllAppLinksViewModelStatesSuccess) {
          final links = state.appLinks;

          /// helper function: get link by type
          String? getLink(String type) {
            try {
              return links.firstWhere((e) => e.type == type).url;
            } catch (_) {
              return null;
            }
          }

          return _buildContent(
            context,
            callNumber: getLink("phone"),
            whatsapp: getLink("whatsapp"),
            facebook: getLink("facebook"),
            instagram: getLink("instagram"),
            tiktok: getLink("tiktok"),
            linkedin: getLink("linkedin"),
            youtube: getLink("youtube"),
            email: getLink("email"),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildContent(
      BuildContext context, {
        String? callNumber,
        String? whatsapp,
        String? facebook,
        String? instagram,
        String? tiktok,
        String? linkedin,
        String? youtube,
        String? email,
      }) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          if (callNumber != null)
            _buildContactCard(
              icon: AssetsManager.whatsapp,
              title: "واتس اب",
              subtitle: callNumber,
              color: Colors.blue,
              onTap: () {
                ContactLauncherService.openWhatsApp(callNumber);

              },
            ),

          SizedBox(height: 20.h),
          _buildSectionTitle("تواصل معنا على المنصات الاجتماعية"),
          SizedBox(height: 16.h),

          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.h,
            childAspectRatio: .9,
            children: [
              if (whatsapp != null)
                _buildSocialCard(
                  platform: "WhatsApp",
                  icon: AssetsManager.whatsapp,
                  color: Color(0xFF25D366),
                  username: "اضغط للتواصل",
                  onTap: () {
                    ContactLauncherService.openWhatsApp(whatsapp);
                  },
                ),
              if (facebook != null)
                _buildSocialCard(
                  platform: "Facebook",
                  icon: AssetsManager.facebook,
                  color: Color(0xFF1877F2),
                  username: "صفحتنا الرسمية",
                  onTap: () => openUrl(facebook),
                ),
              if (instagram != null)
                _buildSocialCard(
                  platform: "Instagram",
                  icon: AssetsManager.instagram,
                  color: Color(0xFFE4405F),
                  username: "@Instagram",
                  onTap: () => openUrl(instagram),
                ),
              if (tiktok != null)
                _buildSocialCard(
                  platform: "Tiktok",
                  icon: AssetsManager.tiktok,
                  color: Color(0xFF1DA1F2),
                  username: "@Twitter",
                  onTap: () => openUrl(tiktok),
                ),
              if (youtube != null)
                _buildSocialCard(
                  platform: "YouTube",
                  icon: AssetsManager.youtube,
                  color: Color(0xFFFF0000),
                  username: "قناتنا",
                  onTap: () => openUrl(youtube),
                ),
              if (linkedin != null)
                _buildSocialCard(
                  platform: "LinkedIn",
                  icon: AssetsManager.linkedin,
                  color: Color(0xFF0A66C2),
                  username: "LinkedIn",
                  onTap: () => openUrl(linkedin),
                ),
            ],
          ),

          SizedBox(height: 24.h),
          _buildContactInfoSection(),
          SizedBox(height: 24.h),

          if (email != null)
            _buildEmailCard(email),
        ],
      ),
    );
  }



  Widget _buildContactCard({
    required String icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8.r,
              offset: Offset(0, 2.h),
            ),
          ],
          border: Border.all(color: Colors.grey.shade200, width: 1.w),
        ),
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.withOpacity(0.1),
                border: Border.all(color: color.withOpacity(0.3), width: 2.w),
              ),
              padding: EdgeInsets.all(12.w),
              child: Image.asset(icon, height: 28.h, width: 28.w, color: color),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18.sp,
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialCard({
    required String platform,
    required String icon,
    required Color color,
    required String username,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.1),
              blurRadius: 12.r,
              offset: Offset(0, 4.h),
            ),
          ],
          border: Border.all(color: color.withOpacity(0.2), width: 1.w),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.withOpacity(0.1),
              ),
              padding: EdgeInsets.all(12.w),
              child: Image.asset(icon, height: 32.h, width: 32.w, color: color),
            ),
            SizedBox(height: 12.h),
            Text(
              platform,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: Colors.grey.shade800,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              username,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                "تواصل الآن",
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorsManager.primaryColor.withOpacity(0.3),
            width: 2.w,
          ),
        ),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w800,
          color: ColorsManager.primaryColor,
        ),
      ),
    );
  }

  Widget _buildContactInfoSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ColorsManager.primaryColor.withOpacity(0.1),
            ColorsManager.primaryColor.withOpacity(0.05),
          ],
        ),
        border: Border.all(
          color: ColorsManager.primaryColor.withOpacity(0.2),
          width: 1.w,
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.info_outline_rounded,
            size: 32.sp,
            color: ColorsManager.primaryColor,
          ),
          SizedBox(height: 12.h),
          Text(
            "معلومات التواصل",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: ColorsManager.primaryColor,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "نحن متاحون للرد على استفساراتكم علي مدار 24 ساعهً",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
            ),
          ),
         
        ],
      ),
    );
  }

  Widget _buildInfoItem(String text, IconData icon) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16.sp, color: ColorsManager.primaryColor),
        SizedBox(width: 4.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }

  Widget _buildEmailCard( String email) {
    return InkWell(
      onTap: () => openUrl("mailto:$email"),
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.orange.withOpacity(0.1),
              blurRadius: 8.r,
              offset: Offset(0, 2.h),
            ),
          ],
          border: Border.all(color: Colors.orange.withOpacity(0.3), width: 1.w),
        ),
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange.withOpacity(0.1),
              ),
              padding: EdgeInsets.all(12.w),
              child: Icon(
                Icons.email_rounded,
                size: 28.sp,
                color: Colors.orange,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "البريد الإلكتروني",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "info@dlylalsham.com",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.orange.shade700,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18.sp,
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:dalel_elsham/core/components/confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../config/routes/routes_manager.dart';
import '../../../../../../../core/cache/shared_preferences.dart';
import '../../../../../../../core/services/open_url_service.dart';
import '../../../../../../../core/services/share_service.dart';
import '../../domain/entities/app_link_entity.dart';
import '../manager/app_links/get_all_app_links_view_model/get_all_app_links_view_model.dart';
import '../manager/app_links/get_all_app_links_view_model/get_all_app_links_view_model_states.dart';
import 'drawer_header_section.dart';
import 'drawer_item.dart';
import 'logout_button.dart';
import 'modal_bottom_sheet_content.dart';

class DrawerContent extends StatefulWidget {
  DrawerContent({super.key});

  @override
  State<DrawerContent> createState() => _DrawerContentState();
}

class _DrawerContentState extends State<DrawerContent> {
  @override
  void initState() {
    super.initState();
    loadAuthToken();
  }

  String? authToken;

  Future<void> loadAuthToken() async {
    final token = SharedPrefHelper.getString("auth_token");
    setState(() {
      authToken = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllAppLinksViewModel, GetAllAppLinksViewModelStates>(
      builder: (context, state) {
        if (state is GetAllAppLinksViewModelStatesLoading) {
          return Column(
            children: [
              const DrawerHeaderSection(),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(top: 16.h),
                  children: [
                    _loadingItem(),
                    _loadingItem(),
                    _loadingItem(),
                    _loadingItem(),
                  ],
                ),
              ),
            ],
          );
        }

        if (state is GetAllAppLinksViewModelStatesError) {
          return Center(child: Text(state.message));
        }

        if (state is GetAllAppLinksViewModelStatesSuccess) {
          final links = state.appLinks;

          AppLinkEntity? getLink(String type) {
            try {
              return links.firstWhere((e) => e.type == type);
            } catch (_) {
              return null;
            }
          }

          final shareLink = getLink("share_app");
          final rateLink = getLink("rate_us");

          return Column(
            children: [
              const DrawerHeaderSection(),

              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(top: 16.h),
                  children: [
                    DrawerItem(
                      icon: Icons.campaign,
                      title: 'أعلن معنا',
                      onTap: () {
                        if (authToken != null && authToken!.isNotEmpty) {
                          Navigator.pushNamed(
                            context,
                            RoutesManager.addNewService,
                          );
                        } else {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            builder: (context) =>
                                const ModalBottomSheetContent(),
                          );
                        }
                      },
                    ),

                    /// مشاركة التطبيق
                    if (shareLink != null)
                      DrawerItem(
                        icon: Icons.share,
                        title: 'مشاركة الدليل',
                        onTap: () {
                          ShareService.shareTemplate(
                            title: "📘 دليل الشام",
                            description:
                                "كل خدماتك ومعلومات مدينتك في تطبيق واحد.\nجربه الآن!",
                            url: shareLink.url,
                            phone: "",
                            location: "",
                          );
                        },
                      ),

                    /// تقييم التطبيق
                    if (rateLink != null)
                      DrawerItem(
                        icon: Icons.star_rate,
                        title: 'تقييمك للتطبيق',
                        onTap: () {
                          openUrl.call(rateLink.url);
                        },
                      ),

                    DrawerItem(
                      icon: Icons.phone_in_talk,
                      title: 'اتصل بنا',
                      onTap: () {
                        Navigator.pushNamed(context, RoutesManager.contactUs);
                      },
                    ),

                    DrawerItem(icon: Icons.settings, title: 'الإعدادات',
                    onTap: () {
                      Navigator.pushNamed(context, RoutesManager.settingsView);
                    },),
                  ],
                ),
              ),

              if (authToken != null && authToken!.isNotEmpty)
                LogoutButton(
                  onTap: () {
                    showConfirmationDialog(
                      context: context,
                      title: 'تسجيل الخروج',
                      message: 'هل أنت متأكد من تسجيل الخروج؟',
                      onConfirm: () {
                        SharedPrefHelper.clear();
                        Navigator.pushNamed(context, RoutesManager.home);
                      },
                    );
                  },
                ),

              SizedBox(height: 16.h),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }

  Widget _loadingItem() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Row(
        children: [
          Container(
            width: 30.w,
            height: 30.w,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Container(
              height: 14.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dalel_elsham/core/utils/assets_manager.dart';
import 'package:dalel_elsham/core/components/contact_button_card.dart';
import '../../../../../../../core/services/contact_launcher_service.dart';

class ProjectDetailsContacts extends StatelessWidget {
  const ProjectDetailsContacts({
    super.key,
    required this.whatsapp,
    required this.facebook,
    required this.instagram,
    required this.website,
  });

  final String whatsapp;
  final String facebook;
  final String instagram;
  final String website;

  bool _isValid(String? x) {
    return x != null && x.trim().isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = [];

    if (_isValid(whatsapp)) {
      buttons.add(
        ContactButtonCard(
          image: AssetsManager.whatsapp,
          onTap: () => ContactLauncherService.openWhatsApp(whatsapp),
        ),
      );
    }

    if (_isValid(facebook)) {
      buttons.add(
        ContactButtonCard(
          image: AssetsManager.facebook,
          onTap: () => ContactLauncherService.openUrl(facebook),
        ),
      );
    }

    if (_isValid(instagram)) {
      buttons.add(
        ContactButtonCard(
          image: AssetsManager.instagram,
          onTap: () => ContactLauncherService.openUrl(instagram),
        ),
      );
    }

    if (_isValid(website)) {
      buttons.add(
        ContactButtonCard(
          image: AssetsManager.world,
          onTap: () => ContactLauncherService.openUrl(website),
        ),
      );
    }

    if (buttons.isEmpty) {
      return SizedBox.shrink(); // لا تظهر أي شيء
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buttons,
      ),
    );
  }
}

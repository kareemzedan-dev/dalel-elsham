import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dalel_elsham/core/utils/assets_manager.dart';
import 'package:dalel_elsham/core/components/contact_button_card.dart';

class ProjectDetailsContacts extends StatelessWidget {
  const ProjectDetailsContacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          ContactButtonCard(image: AssetsManager.whatsapp),
          ContactButtonCard(image: AssetsManager.facebook),
          ContactButtonCard(image: AssetsManager.instagram),
          ContactButtonCard(image: AssetsManager.world),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';


Future<String?> showImageSourcePicker(BuildContext context) {
  return showModalBottomSheet<String>(
    context: context,
    builder: (_) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text("اختر من المعرض"),
            onTap: () => Navigator.pop(context, "gallery"),
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text("استخدم الكاميرا"),
            onTap: () => Navigator.pop(context, "camera"),
          ),
          ListTile(
            leading: const Icon(Icons.close),
            title: const Text("إلغاء"),
            onTap: () => Navigator.pop(context, null),
          ),
        ],
      ),
    ),
  );
}

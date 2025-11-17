import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.order,
    required super.isActive,
    required super.createdAt,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map, String docId) {
    return CategoryModel(
      id: docId,
      name: map["name"] ?? "",
      imageUrl: map["imageUrl"] ?? "",
      order: map["order"] ?? 0,
      isActive: map["isActive"] ?? true,
      createdAt: (map["createdAt"] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "imageUrl": imageUrl,
      "order": order,
      "isActive": isActive,
      "createdAt": createdAt,
    };
  }
}

import '../../domain/entities/job_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class JobModel extends JobEntity {
  JobModel({
    required super.id,
    required super.title,
    required super.description,
    required super.type,
    required super.phone,
    required super.location,
    required super.imageUrl,
    required super.isActive,
    required super.duration,
    required super.createdAt,
    required super.status,
  });

  /// FROM FIRESTORE
  factory JobModel.fromMap(Map<String, dynamic> map, String docId) {
    return JobModel(
      id: docId,
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      type: map['type'] ?? "",
      phone: map['phone'] ?? "",
      location: map['location'] ?? "",
      imageUrl: map['imageUrl'] ?? "",
      isActive: map['isActive'] ?? true,
      status: map['status'] ?? "",
      duration: map['duration'] ?? 0,
      createdAt: (map['createdAt'] is Timestamp)
          ? (map['createdAt'] as Timestamp).toDate()
          : DateTime.tryParse(map['createdAt'] ?? "") ?? DateTime.now(),
    );
  }


  /// TO FIRESTORE
  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "description": description,
      "type": type,
      "phone": phone,
      "location": location,
      "imageUrl": imageUrl,
      "isActive": isActive,
      "duration": duration,
      "createdAt": createdAt,
      "status": status,
    };
  }
}

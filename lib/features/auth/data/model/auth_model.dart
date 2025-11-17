import '../../domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.profileImage,
  });

  factory AuthModel.fromMap(Map<String, dynamic> map, String id) {
    return AuthModel(
      id: id,
      name: map['name'] ?? "",
      email: map['email'] ?? "",
      phone: map['phone'] ?? "",
      profileImage: map['profileImage'] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "profileImage": profileImage,
    };
  }
}

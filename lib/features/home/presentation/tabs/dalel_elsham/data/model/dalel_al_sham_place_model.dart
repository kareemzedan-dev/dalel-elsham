import '../../domain/entities/dalel_al_sham_place_entity.dart';

class DalelAlShamPlaceModel extends DalelAlShamPlaceEntity {
  const DalelAlShamPlaceModel({
    required super.id,
    required super.name,
    required super.description,
    required super.addressText,
    super.mapLink,
    required super.phone,
    required super.images,
  });

  factory DalelAlShamPlaceModel.fromMap(
      Map<String, dynamic> data,
      String docId,
      ) {
    return DalelAlShamPlaceModel(
      id: docId,
      name: data["name"] ?? "",
      description: data["description"] ?? "",
      addressText: data["addressText"] ?? "",
      mapLink: data["mapLink"],
      phone: data["phone"] ?? "",
      images: List<String>.from(data["images"] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "description": description,
      "addressText": addressText,
      "mapLink": mapLink,
      "phone": phone,
      "images": images,
    };
  }
}

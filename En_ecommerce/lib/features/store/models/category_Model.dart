import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.isFeatured,
    this.parentId = "",
    required this.image,
  });

  static CategoryModel empty() => CategoryModel(
        id: "",
        name: "",
        image: "",
        isFeatured: false,
      );

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'IsFeatured': isFeatured,
    };
  }

  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();

    return CategoryModel(
      id: document.id,
      name: data?['Name'] ?? '',
      isFeatured: data?['IsFeatured'] ?? false,
      image: data?['Image'] ?? '',
      parentId: data?['ParentId'] ?? '',
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String imageUrl;
  final String targetScreen;
  final bool active;
  BannerModel(
      {required this.active,
      required this.imageUrl,
      required this.targetScreen});

  Map<String, dynamic> toJson() {
    return {
      'ImageUrl': imageUrl,
      'Active': active,
      'TargetScreen': targetScreen,
    };
  }

  factory BannerModel.fromSnaapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BannerModel(
        active: data['Active'] ?? '',
        imageUrl: data['ImageUrl'] ?? '',
        targetScreen: data['TargetScreen'] ?? '');
  }
}

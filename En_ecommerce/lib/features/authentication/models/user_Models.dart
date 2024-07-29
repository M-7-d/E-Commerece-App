import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:en_ecommerce/utills/formatters/formaters.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      required this.profilePicture,
      required this.username});

  String get fullName => '$firstName $lastName';
  String get formattedPhoneNo => TFormater.formatPhoneNumber(phoneNumber);
  static List<String> nameParts(fullName) => fullName.split(" ");
  static String generateUserName(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUserName = "$firstName$lastName";
    String userNameWithPrefix = "cwt_$camelCaseUserName";
    return userNameWithPrefix;
  }

  static UserModel empty() => UserModel(
      id: "",
      firstName: "",
      lastName: "",
      email: "",
      phoneNumber: "",
      profilePicture: "",
      username: "");

  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'UserName': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          id: document.id,
          firstName: data['FirstName'] ?? '',
          lastName: data['LastName'] ?? '',
          email: data['Email'] ?? '',
          phoneNumber: data['PhoneNumber'] ?? '',
          profilePicture: data['ProfilePicture'] ?? '',
          username: data['UserName'] ?? '');
    } else {
      return UserModel.empty();
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:en_ecommerce/utills/formatters/formaters.dart';

class AddressModel {
  String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String city;
  final String state;
  final String postalcode;
  final String country;
  final DateTime? date;
  bool seletctedAddres;

  AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.city,
    required this.state,
    required this.postalcode,
    required this.country,
    this.date,
    this.seletctedAddres = true,
  });
  String get formattedPhone => TFormater.formatPhoneNumber(phoneNumber);
  static AddressModel empty() => AddressModel(
        id: "",
        name: "",
        phoneNumber: "",
        street: "",
        city: "",
        state: "",
        postalcode: "",
        country: "",
      );

  Map<String, dynamic> toJson() {
    return {
      "Id": id,
      "Name": name,
      "PhoneNumber": phoneNumber,
      "Street": state,
      "City": city,
      "State": state,
      "PostalCode": postalcode,
      "Country": country,
      "DateTime": date,
      "SelectedAddress": seletctedAddres
    };
  }

  factory AddressModel.fromMap(Map<String, double> data) {
    return AddressModel(
        id: data["Id"] as String,
        name: data["Name"] as String,
        phoneNumber: data["PhoneNumber"] as String,
        street: data["Street"] as String,
        city: data["City"] as String,
        state: data["State"] as String,
        postalcode: data["PostalCode"] as String,
        country: data["Country"] as String,
        seletctedAddres: data["SelectedAddress"] as bool,
        date: (data["DateTime"] as Timestamp).toDate());
  }

  factory AddressModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return AddressModel(
        id: snapshot.id,
        name: data["Name"] ?? "",
        phoneNumber: data["PhoneNumber"] ?? "",
        street: data["Street"] ?? "",
        city: data["City"] ?? "",
        state: data["State"] ?? "",
        postalcode: data["PostalCode"] ?? "",
        country: data["Country"] ?? "",
        seletctedAddres: data["SelectedAddress"] as bool,
        date: (data["DateTime"] as Timestamp).toDate());
  }

  @override
  String toString() {
    return "$street, $city, $state ,$postalcode,$country";
  }
}

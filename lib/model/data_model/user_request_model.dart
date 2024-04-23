import 'package:cloud_firestore/cloud_firestore.dart';

import '../controller/formater.dart';

class UserModel {
  final String courtName;
  final String courtPhoneNumber;
  final String courtEmailAddress;
  final String courtDescription;
  final String openingTime;
  final String closingTime;
  final String courtLocation;
  final String images;
  final String ownerPhoto;
  final String ownerFullName;
  final String ownerPhoneNumber;
  final String ownerEmailAddress;
  final bool isOwner;
  final bool isRegistered;

  UserModel({
    required this.courtName,
    required this.courtPhoneNumber,
    required this.courtEmailAddress,
    required this.courtDescription,
    required this.openingTime,
    required this.closingTime,
    required this.courtLocation,
    required this.images,
    required this.ownerPhoto,
    required this.ownerFullName,
    required this.ownerPhoneNumber,
    required this.ownerEmailAddress,
    required this.isOwner,
    required this.isRegistered,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      courtName: json['courtName'] ?? '',
      courtPhoneNumber: json['courtPhoneNumber'] ?? '',
      courtEmailAddress: json['courtEmailAddress'] ?? '',
      courtDescription: json['courtDescription'] ?? '',
      openingTime: json['openingTime'] ?? '',
      closingTime: json['closingTime'] ?? '',
      courtLocation: json['courtLocation'] ?? '',
      images: json['images'] ?? '',
      ownerPhoto: json['ownerPhoto'] ?? '',
      ownerFullName: json['ownerFullName'] ?? '',
      ownerPhoneNumber: json['ownerPhoneNumber'] ?? '',
      ownerEmailAddress: json['ownerEmailAddress'] ?? '',
      isOwner: json['isOwner'] ?? false,
      isRegistered: json['isRegistered'] ?? false,
    );
  }
  factory UserModel.emptyUserModel() {
    return UserModel(
      courtName: '',
      courtPhoneNumber: '',
      courtEmailAddress: '',
      courtDescription: '',
      openingTime: '',
      closingTime: '',
      courtLocation: '',
      images: '',
      ownerPhoto: '',
      ownerFullName: '',
      ownerPhoneNumber: '',
      ownerEmailAddress: '',
      isOwner: false,
      isRegistered: false,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      courtName: map['courtName'] ?? '',
      courtPhoneNumber: map['courtPhoneNumber'] ?? '',
      courtEmailAddress: map['courtEmailAddress'] ?? '',
      courtDescription: map['courtDescription'] ?? '',
      openingTime: map['openingTime'] ?? '',
      closingTime: map['closingTime'] ?? '',
      courtLocation: map['courtLocation'] ?? '',
      images: map['images'] ?? '',
      ownerPhoto: map['ownerPhoto'] ?? '',
      ownerFullName: map['ownerFullName'] ?? '',
      ownerPhoneNumber: map['ownerPhoneNumber'] ?? '',
      ownerEmailAddress: map['ownerEmailAddress'] ?? '',
      isOwner: map['isOwner'] ?? false,
      isRegistered: map['isRegistered'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'courtName': courtName,
      'courtPhoneNumber': courtPhoneNumber,
      'courtEmailAddress': courtEmailAddress,
      'courtDescription': courtDescription,
      'openingTime': openingTime,
      'closingTime': closingTime,
      'courtLocation': courtLocation,
      'images': images,
      'ownerPhoto': ownerPhoto,
      'ownerFullName': ownerFullName,
      'ownerPhoneNumber': ownerPhoneNumber,
      'ownerEmailAddress': ownerEmailAddress,
      'isOwner': isOwner,
      'isRegistered': isRegistered,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'courtName': courtName,
      'courtPhoneNumber': courtPhoneNumber,
      'courtEmailAddress': courtEmailAddress,
      'courtDescription': courtDescription,
      'openingTime': openingTime,
      'closingTime': closingTime,
      'courtLocation': courtLocation,
      'images': images,
      'ownerPhoto': ownerPhoto,
      'ownerFullName': ownerFullName,
      'ownerPhoneNumber': ownerPhoneNumber,
      'ownerEmailAddress': ownerEmailAddress,
      'isOwner': isOwner,
      'isRegistered': isRegistered,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    return UserModel(
      courtName: data['courtName'] ?? '',
      courtPhoneNumber: data['courtPhoneNumber'] ?? '',
      courtEmailAddress: data['courtEmailAddress'] ?? '',
      courtDescription: data['courtDescription'] ?? '',
      openingTime: data['openingTime'] ?? '',
      closingTime: data['closingTime'] ?? '',
      courtLocation: data['courtLocation'] ?? '',
      images: data['images'] ?? '',
      ownerPhoto: data['ownerPhoto'] ?? '',
      ownerFullName: data['ownerFullName'] ?? '',
      ownerPhoneNumber: data['ownerPhoneNumber'] ?? '',
      ownerEmailAddress: data['ownerEmailAddress'] ?? '',
      isOwner: data['isOwner'] ?? true,
      isRegistered: data['isRegistered'] ?? false,
    );
  }

  String get formattedOwnerPhoneNumber =>
      Formatter.formatPhoneNumber(ownerPhoneNumber);

  List<String> splitFullName(String fullName) => fullName.split(' ');
}

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
   String? email;
   String? firstName;
   String? lastName;
   String? phoneNumber;
   String? countryCode;
   String? dialCode;
   String? image;
   String? uid;
   Timestamp? createdAt;

  UserModel({
 this.email,
 this.firstName,
 this.lastName,
 this.countryCode,
 this.dialCode,
 this.phoneNumber,
 this.image,
 this.uid,
 this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    email: json['email'],
    firstName: json['firstName'],
    lastName: json['lastName'],
    phoneNumber: json['phoneNumber'],
    dialCode: json['dialCode'],
    image: json['image'],
    uid: json['uid'],
    countryCode: json['countryCode'],
    createdAt: json['createdAt'],
  );

  Map<String, dynamic> toJson() => {
    'email': email,
    'dialCode': dialCode,
    'countryCode': countryCode,
    'firstName': firstName,
    'lastName': lastName,
    'phoneNumber': phoneNumber,
    'image': image,
    'uid': uid,
    'createdAt': createdAt,
  };

}

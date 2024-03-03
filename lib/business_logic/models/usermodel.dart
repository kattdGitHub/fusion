import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
   String? email;
   String? firstName;
   String? lastName;
   String? phoneNumber;
   String? image;
   String? uid;
   Timestamp? createdAt;

  UserModel({
 this.email,
 this.firstName,
 this.lastName,
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
    image: json['image'],
    uid: json['uid'],
    createdAt: json['createdAt'],
  );

  Map<String, dynamic> toJson() => {
    'email': email,
    'firstName': firstName,
    'lastName': lastName,
    'phoneNumber': phoneNumber,
    'image': image,
    'uid': uid,
    'createdAt': createdAt,
  };

  UserModel copyWith({
    String? email,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? image,
    String? uid,
    Timestamp? createdAt,
  }) {
    return UserModel(
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      image: image ?? this.image,
      uid: uid ?? this.uid,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

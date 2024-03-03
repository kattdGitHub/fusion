import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantModel {
  String? name;
  String? userId;
  String? location;
  String? phoneNumber;
  String? openTime;
  String? closeTime;
  String? description;
  String? image;
  String? docPath;
  String? id;
  Timestamp? createdAt;

  RestaurantModel({
    this.name,
    this.userId,
    this.location,
    this.phoneNumber,
    this.openTime,
    this.createdAt,
    this.closeTime,
    this.description,
    this.image,
    this.docPath,
    this.id,
  });

  // Factory constructor to create Restaurant object from JSON data
  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      name: json['name'],
      userId: json['userId'],
      createdAt: json['createdAt'],
      location: json['location'],
      phoneNumber: json['phoneNumber'],
      openTime: json['openTime'],
      closeTime: json['closeTime'],
      description: json['description'],
      image: json['image'],
      docPath: json['docPath'],
      id: json['id'],
    );
  }

  // Method to convert Restaurant object to JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'userId': userId,
      'location': location,
      'createdAt': createdAt,
      'phoneNumber': phoneNumber,
      'openTime': openTime,
      'closeTime': closeTime,
      'description': description,
      'image': image,
      'docPath': docPath,
      'id': id,
    };
  }
}

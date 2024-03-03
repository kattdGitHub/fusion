import 'package:cloud_firestore/cloud_firestore.dart';

class MenuModel {
   String? id;
   String? name;
   String? userId;
   String? price;
   String? quantity;
   String? restaurantId;
   String? description;
   String? image;
   Timestamp? createdAt;

  MenuModel({
     this.id,
     this.name,
     this.userId,
     this.price,
     this.createdAt,
     this.quantity,
     this.restaurantId,
     this.description,
     this.image,
  });

  // Factory constructor to create MenuItem object from JSON data
  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      id: json['id'],
      name: json['name'],
      userId: json['userId'],
      price: json['price'],
      createdAt: json['createdAt'],
      quantity: json['quantity'],
      restaurantId: json['restaurantId'],
      description: json['description'],
      image: json['image'],
    );
  }

  // Method to convert MenuItem object to JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'userId': userId,
      'createdAt': createdAt,
      'price': price,
      'quantity': quantity,
      'restaurantId': restaurantId,
      'description': description,
      'image': image,
    };
  }

}

class MenuModel {
   String? id;
   String? name;
   String? userId;
   String? price;
   String? quantity;
   String? restaurantId;
   String? description;
   String? image;

  MenuModel({
     this.id,
     this.name,
     this.userId,
     this.price,
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
      'price': price,
      'quantity': quantity,
      'restaurantId': restaurantId,
      'description': description,
      'image': image,
    };
  }

  MenuModel copyWith({
    String? id,
    String? name,
    String? userId,
    String? price,
    String? quantity,
    String? restaurantId,
    String? description,
    String? image,
  }) {
    return MenuModel(
      id: id ?? this.id,
      name: name ?? this.name,
      userId: userId ?? this.userId,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      restaurantId: restaurantId ?? this.restaurantId,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }
}

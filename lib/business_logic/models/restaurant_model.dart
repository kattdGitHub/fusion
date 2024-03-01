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

  RestaurantModel({
    this.name,
    this.userId,
    this.location,
    this.phoneNumber,
    this.openTime,
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
      'phoneNumber': phoneNumber,
      'openTime': openTime,
      'closeTime': closeTime,
      'description': description,
      'image': image,
      'docPath': docPath,
      'id': id,
    };
  }

  RestaurantModel copyWith({
    String? name,
    String? userId,
    String? location,
    String? phoneNumber,
    String? openTime,
    String? closeTime,
    String? description,
    String? image,
    String? docPath,
    String? id,
  }) {
    return RestaurantModel(
      name: name ?? this.name,
      userId: userId ?? this.userId,
      location: location ?? this.location,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      openTime: openTime ?? this.openTime,
      closeTime: closeTime ?? this.closeTime,
      description: description ?? this.description,
      image: image ?? this.image,
      docPath: docPath ?? this.docPath,
      id: id ?? this.id,
    );
  }
}

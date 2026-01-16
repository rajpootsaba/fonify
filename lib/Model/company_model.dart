class CompanyModel {
  final String image;
  final String name;
  final String price;

  CompanyModel({required this.image,
  required this.name,
  required this.price});

  // From JSON
  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      image: json['image'] ?? "",
      name: json['name'],
      price: json['price']
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      'price': price
    };
  }
}

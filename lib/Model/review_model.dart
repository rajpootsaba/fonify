class ReviewModel{
  final String name;
  final String role;
  final String text;
  final int rating;
  final String image;

  ReviewModel({
    required this.name,
    required this.role,
    required this.text,
    required this.rating,
    required this.image
  });

  factory ReviewModel.fromMap(Map<String, dynamic> map){
    return ReviewModel(
      name: map['name'] ?? '',
      role: map['role'] ?? '',
      text: map['text'] ?? '',
      rating: map['rating'] ?? 0,
      image: map['image'] ?? '',
    );
  }

  Map<String, dynamic> toMap(){
    return{
      'name': name,
      'role': role,
      'text': text,
      'rating': rating,
      'image': image,
    };
  }
}
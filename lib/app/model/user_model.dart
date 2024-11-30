class User {
  final String id;
  final String name;
  final String phone;
  final String bloodType;
  final int weight;
  final int height;
  final int age;

  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.bloodType,
    required this.weight,
    required this.height,
    required this.age,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      bloodType: json['bloodType'] as String,
      weight: json['weight'] as int,
      height: json['hight'] as int, // Note: "hight" typo in API
      age: json['age'] as int,
    );
  }
}

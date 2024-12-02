class Admin {
  final String name;
  final String username;

  Admin({required this.name, required this.username});

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      name: json['name'],
      username: json['username'],
    );
  }
}

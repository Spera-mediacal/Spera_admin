class Station {
  final int id;
  final String location;
  final String name;
  final String phone;
  final int adminId;

  Station({
    required this.id,
    required this.location,
    required this.name,
    required this.phone,
    required this.adminId,
  });

  factory Station.fromJson(Map<String, dynamic> json) {
    return Station(
      id: json['id'],
      location: json['location'],
      name: json['name'],
      phone: json['phone'],
      adminId: json['admin_id'],
    );
  }
}

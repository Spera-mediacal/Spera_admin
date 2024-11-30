class DoctorModel {
  final int id;
  final String name;
  final String specialization;
  final List<String> workDays;
  final String phone;
  final String startHour;
  final String endHour;
  final double rate;
  final String address;
  final String joinDate;
  final String image;

  DoctorModel({
    required this.id,
    required this.name,
    required this.specialization,
    required this.workDays,
    required this.phone,
    required this.startHour,
    required this.endHour,
    required this.rate,
    required this.address,
    required this.joinDate,
    required this.image,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {

    return DoctorModel(
      id: int.parse(json['id']),
      name: json['name'],
      specialization: json['specialization'],
      workDays: List<String>.from(json['workDays']),
      phone: json['phone'],
      startHour: json['start'],
      endHour: json['end'],
      rate: (json['rate'] is String)
          ? double.parse(json['rate'])
          : (json['rate'] as num).toDouble(),
      address: json['address'],
      joinDate: json['joinDate'],
      image: json['image'],
    );

  }

  Map<String, dynamic> toJson() {
    return {
      'id': id.toString(),
      'name': name,
      'specialization': specialization,
      'workDays': workDays,
      'phone': phone,
      'start': startHour,
      'end': endHour,
      'rate': rate,
      'address': address,
      'joinDate': joinDate,
      'image': image,
    };
  }
}
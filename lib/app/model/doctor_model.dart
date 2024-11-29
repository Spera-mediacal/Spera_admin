
class DoctorModel {
  final int id;
  final String name;
  final String address;
  final String image;
  final String phone;
  final String specialization;
  final String startHour;
  final String endHour;
  final String joinDate;
  final List<String> workDays;
  final double rate;

  DoctorModel({
    required this.id,
    required this.name,
    required this.address,
    required this.image,
    required this.phone,
    required this.specialization,
    required this.startHour,
    required this.endHour,
    required this.joinDate,
    required this.workDays,
    required this.rate,
  });
}


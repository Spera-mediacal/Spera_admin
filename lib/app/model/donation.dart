class Donate {
  final int donateId;
  final int donateQuantity;
  final String donateDate;
  final String bloodType;
  final String userId;
  final String name;

  Donate({
    required this.donateId,
    required this.donateQuantity,
    required this.donateDate,
    required this.bloodType,
    required this.userId,
    required this.name,
  });

  factory Donate.fromJson(Map<String, dynamic> json) {
    return Donate(
      donateId: json['donate_id'],
      donateQuantity: json['donate_quantity'],
      donateDate: json['donate_date'],
      bloodType: json['blood_type'],
      userId: json['user_id'],
      name: json['name'],
    );
  }
}

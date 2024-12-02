class Donation {
  final String userId;
  final int id;
  final int quantity;
  final String date;
  final String bloodType; // New field for blood type

  Donation({
    required this.userId,
    required this.id,
    required this.quantity,
    required this.date,
    required this.bloodType, // Initialize the blood type
  });

  factory Donation.fromJson(Map<String, dynamic> json) {
    return Donation(
      userId: json['user_id'],
      id: json['donate_id'], // Updated key to match API response
      quantity: json['donate_quantity'], // Updated key to match API response
      date: json['donate_date'], // Updated key to match API response
      bloodType: json['blood_type'], // Map blood type from API response
    );
  }
}

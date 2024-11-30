class Donation {
  final String userId;
  final int id;
  final int quantity;
  final String date;

  Donation({
    required this.userId,
    required this.id,
    required this.quantity,
    required this.date,
  });

  factory Donation.fromJson(Map<String, dynamic> json) {
    return Donation(
      userId: json['user_id'],
      id: json['id'],
      quantity: json['quantity'],
      date: json['date'],
    );
  }
}

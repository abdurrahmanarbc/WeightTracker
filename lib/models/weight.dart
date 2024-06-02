class Weight {
  final int id;
  final int
      userId; // Kilonun hangi kullanıcıya ait olduğunu belirtmek için kullanıcı kimliği
  final double weight; // Kilo değeri
  final double height; // Boy değeri
  final DateTime date; // Kilonun kaydedildiği tarih

  Weight({
    required this.id,
    required this.userId,
    required this.weight,
    required this.height,
    required this.date,
  });

  // JSON formatından Weight nesnesine dönüşüm için fabrika metodu
  factory Weight.fromJson(Map<String, dynamic> json) {
    return Weight(
      id: json['id'],
      userId: json['userId'],
      weight: json['weight'].toDouble(),
      height: json['height'].toDouble(),
      date: DateTime.parse(json['date']),
    );
  }

  // Weight nesnesinden JSON formatına dönüşüm için metod
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'weight': weight,
      'height': height,
      'date': date.toIso8601String(),
    };
  }
}

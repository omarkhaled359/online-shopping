class DebitCard {
  final int id;
  final String promoCode;
  final String type;
  final double value;

  DebitCard({
    required this.id,
    required this.promoCode,
    required this.type,
    required this.value,
  });

  // Factory constructor for creating Card from a Map
  factory DebitCard.fromMap(Map<String, dynamic> map) {
    return DebitCard(
      id: map['id'],
      promoCode: map['promoCode'],
      type: map['type'],
      value: map['value'],
    );
  }

  // Method to convert Card to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'promoCode': promoCode,
      'type': type,
      'value': value,
    };
  }

  @override
  String toString() {
    return 'DebitCard(id: $id, promoCode $promoCode, type $type, value $value)';
  }
}
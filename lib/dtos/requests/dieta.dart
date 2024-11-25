class Dieta {
  final String alimento;
  final String cantidad;

  Dieta({
    required this.alimento,
    required this.cantidad,
  });

  factory Dieta.fromJson(Map<String, dynamic> json) {
    return Dieta(
      alimento: json['alimento'] ?? '',
      cantidad: json['cantidad'] ?? '',
    );
  }
}

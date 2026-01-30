class Service {
  final String id;
  final String name;
  final String categoryId;
  final int price;
  final int durationMinutes;
  final bool isActive;

  Service({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.price,
    required this.durationMinutes,
    required this.isActive,
  });
}

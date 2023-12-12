class Car {
  final bool available;
  final String name, type, description, transmissionType, color, imageCover;
  final double price, rating;
  final bool available;
  final int maxSpeed, fuelCapacity;
  final int doorCount, seatCount;
  final List<String> photos;

  Car({
    required this.available,
    required this.name,
    required this.type,
    required this.available,
    required this.description,
    required this.transmissionType,
    required this.color,
    required this.imageCover,
    required this.price,
    required this.maxSpeed,
    required this.fuelCapacity,
    required this.doorCount,
    required this.seatCount,
    required this.rating,
    required this.photos,
  });

  factory Car.fromMap(Map<String, dynamic> data) {
    return Car(
      available: data['available'] ?? "Gagal mengambil available",
      name: data['name'] ?? "Gagal mengambil nama",
      type: data['type'] ?? "Gagal mengambil type",
      description: data['description'] ?? "Gagal mengambil deskripsi",
      transmissionType: data['transmissionType'] ?? "Gagal mengambil transmissionType",
      color: data['color'] ?? "Gagal mengambil color",
      imageCover: data['imageCover'] ?? "Gagal mengambil imageCover",
      price: data['price'].toDouble() ?? 0,
      maxSpeed: data['maxSpeed'] ?? 0,
      fuelCapacity: data['fuelCapacity'] ?? 0,
      doorCount: data['doorCount'] ?? 0,
      seatCount: data['seatCount'] ?? 0,
      rating: data['rating'].toDouble() ?? 0,
      photos: List<String>.from(data['photos'] ?? []),
    );
  }
}

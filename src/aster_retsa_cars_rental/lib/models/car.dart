class Car {
  final String name, type, description, transmissionType, color, imageCover;
  final double price, rating;
  final int maxSpeed, fuelCapacity;
  final int doorCount, seatCount;
  final List<String> photos;

  Car({
    required this.name,
    required this.type,
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
}

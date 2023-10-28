class Car {
  final String name, type, description, transmissionType, color;
  final int rentalPricePerDay,
      maxSpeed,
      fuelCapacity,
      doorCount,
      seatCount,
      rating;
  final List<String> photos;

  Car({
    required this.name,
    required this.rentalPricePerDay,
    required this.type,
    required this.description,
    required this.transmissionType,
    required this.color,
    required this.maxSpeed,
    required this.fuelCapacity,
    required this.doorCount,
    required this.seatCount,
    required this.rating,
    required this.photos,
  });
}

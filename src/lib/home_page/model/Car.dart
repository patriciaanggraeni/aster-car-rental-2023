class Car {
  String name, image;
  double rating, price;
  int seat, tank, speed;

  Car({
    required this.name,
    required this.rating,
    required this.image,
    required this.price,
    required this.seat,
    required this.tank,
    required this.speed,
  });

  String getName() => this.name;
  String getImage() => this.image;
  double getRating() => this.rating;
  double getPrice() => this.price;
  int getSeat() => this.seat;
  int getTank() => this.tank;
  int getSpeed() => this.speed;

}
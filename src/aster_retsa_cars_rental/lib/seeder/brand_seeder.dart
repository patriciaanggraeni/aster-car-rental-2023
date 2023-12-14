import '../models/brand.dart';

class BrandSeeder {
  List<Brand> getListBrand() => [
    Brand(
        brand: "Mercedes",
        image: "mercedes_logo.png"
    ),
    Brand(
        brand: "Nissan",
        image: "nissan_logo.png"),
    Brand(
        brand: "Porsche",
        image: "porsche_logo.png"),
    Brand(
        brand: "Jeep",
        image: "jeep_logo.png"),
  ];
}

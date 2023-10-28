
import 'package:src/home_page/model/Car.dart';

class CarSeeder {

  List<Car> getListCar() => [
    Car(
        name: "Lamborgini Centenario",
        rating: 4.5,
        image: "assets/images/cars/lamborgini_centenario.png",
        price: 1200,
        seat: 2,
        tank: 55,
        speed: 450
    ),
    Car(
        name: "Hummer H3",
        rating: 5.0,
        image: "assets/images/cars/hummer_h3.png",
        price: 700,
        seat: 5,
        tank: 40,
        speed: 250
    ),
    Car(
        name: "Aston Martin V12",
        rating: 4.0,
        image: "assets/images/cars/aston_martin_v12.png",
        price: 900,
        seat: 4,
        tank: 30,
        speed: 350
    )
  ];
}
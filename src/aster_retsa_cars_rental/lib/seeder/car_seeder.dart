import '../models/car.dart';

class CarSeeder {
  List<Car> getListCar() => [
        Car(
          name: "Innova Zenix 2023",
          price: 400,
          type: "V Hybrid",
          available: true,
          description:
              "One of the favorite MPVs for Indonesian families now has its newest generation which provides technology that makes improvements in various sectors as well as unmatched comfort. The Toyota Innova Zenix is ​​the latest generation of the Innova model which has been around for a long time. There are various interesting things that are specifically present in the Toyota Innova Zenix.",
          transmissionType: "Automatic",
          color: 'White',
          imageCover: "innova_zenix/innova_zenix.png",
          maxSpeed: 250,
          fuelCapacity: 52,
          doorCount: 4,
          seatCount: 7,
          rating: 4,
          photos: [
            "cars/innova_zenix/zenix_front.png",
            "cars/innova_zenix/zenix_back.png",
            "cars/innova_zenix/zenix_side.png",
          ],
        ),
        Car(
          name: "Lamborgini Centenario",
          price: 400,
          type: "ZF 8-speed",
          available: true,
          description:
              "Here are the technical characteristics of the Lamborghini Centenario: equipped with a 770 CV aspirated V12 engine springing from 0 to 100 km/h in 2.8 seconds.",
          transmissionType: "Automatic Manual",
          color: 'Black',
          imageCover: "lamborgini_centenario/lamborgini_centenario.png",
          maxSpeed: 450,
          fuelCapacity: 55,
          doorCount: 2,
          seatCount: 2,
          rating: 4.5,
          photos: [
            "zenix_front.png",
            "zenix_back.png",
            "zenix_side.png",
          ],
        ),
        Car(
          name: "Hummer H3",
          price: 700,
          type: "Hydra Matic",
          available: true,
          description:
              "The Hummer H3 is an off-road vehicle that was produced from 2005 to 2010 by General Motors. The smallest model of the Hummer lineup, it was offered as a 5-door SUV or a 4-door pickup truck known as the H3T",
          transmissionType: "Automatic",
          color: 'Brown',
          imageCover: "hummer_h3/hummer_h3.png",
          maxSpeed: 250,
          fuelCapacity: 40,
          doorCount: 4,
          seatCount: 5,
          rating: 5.0,
          photos: [
            "zenix_front.png",
            "zenix_back.png",
            "zenix_side.png",
          ],
        ),
        Car(
          name: "Aston Martin V12",
          price: 900,
          type: "V12 Vantage",
          available: true,
          description:
              "V12 Vantage is the most powerful and dynamically capable V12 Vantage ever, with 700PS, 200mph of top speed and 3.4 seconds of top speed.",
          transmissionType: "Automatic",
          color: 'Red',
          imageCover: "aston_martin_v12/aston_martin_v12.png",
          maxSpeed: 350,
          fuelCapacity: 30,
          doorCount: 4,
          seatCount: 4,
          rating: 4.0,
          photos: [
            "zenix_front.png",
            "zenix_back.png",
            "zenix_side.png",
          ],
        ),
      ];
}

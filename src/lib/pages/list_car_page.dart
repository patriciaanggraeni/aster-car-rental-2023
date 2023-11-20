import 'package:flutter/material.dart';
import 'package:src/widgets/home_page_widget/available_cars_widget/rating_widget.dart';
import 'package:src/widgets/home_page_widget/search_field_widget.dart';

import '../seeder/car_seeder.dart';
import '../widgets/home_page_widget/filter_widget.dart';

class ListCarPage extends StatelessWidget {
  const ListCarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cars = CarSeeder().getListCar();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomSearchFieldWidget(),
                  CustomFilterWidget(),
                ],
              ),
              const SizedBox(height: 12),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: cars.length,
                  itemBuilder: (context, index) {
                    final item = cars[index];
                    return InkWell(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFF222525),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Available',
                                style: TextStyle(color: Colors.white)),
                            Expanded(
                              child: Image(
                                image: AssetImage(
                                  "assets/images/cars/${item.imageCover}",
                                ),
                              ),
                            ),
                            Text(
                              item.name,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${item.price.toString()}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                CustomRatingWidget(availableCar: item),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

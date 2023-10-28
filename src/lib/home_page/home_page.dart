import 'package:flutter/material.dart';
import 'package:src/home_page/model/BrandSeeder.dart';
import 'package:src/home_page/model/CarSeeder.dart';
import 'package:src/home_page/widgets/app_bar_widget.dart';
import 'package:src/home_page/widgets/available_cars_widget/avaible_cars_widget.dart';
import 'package:src/home_page/widgets/brand_widget.dart';
import 'package:src/home_page/widgets/filter_widget.dart';
import 'package:src/home_page/widgets/offer_widget.dart';
import 'package:src/home_page/widgets/search_field_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final cars = CarSeeder().getListCar();
  final brands = BrandSeeder().getListBrand();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea (
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const CustomAppBarWidget(),
              const SizedBox(height: 30,),
              Expanded(
                child: ListView(
                  children: [
                    const Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomSearchFieldWidget(),
                        CustomFilterWidget()
                      ],
                    ),
                    const SizedBox(height: 15,),
                    CustomOfferWidget(cars: cars),
                    const SizedBox(height: 15,),
                    CustomBrandWidget(brands: brands),
                    const SizedBox(height: 15,),
                    CustomAvailableCarsWidget(availableCars: cars),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
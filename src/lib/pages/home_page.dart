import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:src/seeder/brand_seeder.dart';
import 'package:src/seeder/car_seeder.dart';
import 'package:src/pages/detail_page.dart';
import 'package:src/widgets/home_page_widget/app_bar_widget.dart';
import '../models/car.dart';
import '../widgets/home_page_widget/available_cars_widget/avaible_cars_widget.dart';
import '../widgets/home_page_widget/brand_widget.dart';
import '../widgets/home_page_widget/filter_widget.dart';
import '../widgets/home_page_widget/offer_widget.dart';
import '../widgets/home_page_widget/search_field_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _cars = CarSeeder().getListCar();
  final _brands = BrandSeeder().getListBrand();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const CustomAppBarWidget(),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          Car car = _cars[index];
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomSearchFieldWidget(),
                    CustomFilterWidget(),
                  ],
                ),
              ),
              CustomOfferWidget(cars: _cars),
              CustomBrandWidget(brands: _brands),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      ctx: context,
                      child: DetailPage(car: car),
                      inheritTheme: true,
                      duration: const Duration(milliseconds: 500),
                      type: PageTransitionType.fade,
                    ),
                  );
                },
                child: CustomAvailableCarsWidget(availableCars: _cars),
              )
            ],
          );
        },
      ),
    );
  }
}

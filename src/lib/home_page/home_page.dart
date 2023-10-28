import 'package:flutter/material.dart';
import 'package:src/home_page/model/BrandSeeder.dart';
import 'package:src/home_page/model/CarSeeder.dart';
import 'package:src/home_page/widgets/app_bar_widget.dart';
import 'package:src/home_page/widgets/available_cars_widget/avaible_cars_widget.dart';
import 'package:src/home_page/widgets/bottom_navigation_widget.dart';
import 'package:src/home_page/widgets/brand_widget.dart';
import 'package:src/home_page/widgets/filter_widget.dart';
import 'package:src/home_page/widgets/offer_widget.dart';
import 'package:src/home_page/widgets/search_field_widget.dart';
import 'package:src/pages/detail_page.dart';

import '../models/car.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  final _cars = CarSeeder().getListCar();
  final _brands = BrandSeeder().getListBrand();
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const CustomAppBarWidget(),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) => setState(() { _currentPage = index; }),
        children: [
          ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
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
                  CustomAvailableCarsWidget(availableCars: _cars),
                ],
              );
            },
          ),
          Page3(),
          Page4(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationWidget(currentPage: _currentPage, pageController: _pageController),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 3",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 4",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
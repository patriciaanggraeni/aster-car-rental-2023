import 'package:flutter/material.dart';
import 'package:src/models/brand_seeder.dart';
import 'package:src/models/car_seeder.dart';
import 'package:src/pages/about.dart';
import 'package:src/pages/detail_page.dart';
import 'package:src/pages/history_page.dart';
import 'package:src/pages/login_page.dart';
import 'package:src/pages/register_page.dart';
import 'package:src/widgets/home_page_widget/app_bar_widget.dart';
import '../models/car.dart';
import '../widgets/home_page_widget/available_cars_widget/avaible_cars_widget.dart';
import '../widgets/home_page_widget/bottom_navigation_widget.dart';
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
  int _currentPage = 0;
  final _cars = CarSeeder().getListCar();
  final _brands = BrandSeeder().getListBrand();
  final _pageController = PageController();

  final detailPageRoute = '/detail_page';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        detailPageRoute: (context) => const DetailPage(),
      },
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: const ColorScheme.light(
          primary: Colors.black,
          background: Colors.white,
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const CustomAppBarWidget(),
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) => setState(() {
            _currentPage = index;
          }),
          children: [
            ListView.builder(
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
                      onTap: () => Navigator.pushNamed(context, detailPageRoute,
                          arguments: car),
                      child: CustomAvailableCarsWidget(availableCars: _cars),
                    )
                  ],
                );
              },
            ),
            // DetailPage(car: CarSeeder().innovaZenix),
            HistoryPage(),
            const LoginPage(),
            const RegisterPage(),
            const About(),
          ],
        ),
        bottomNavigationBar: CustomBottomNavigationWidget(
            currentPage: _currentPage, pageController: _pageController),
      ),
    );
  }
}
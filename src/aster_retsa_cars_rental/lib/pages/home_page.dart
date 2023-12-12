import 'package:aster_retsa_cars_rental/bloc/car_bloc/car_bloc.dart';
import 'package:aster_retsa_cars_rental/bloc/car_bloc/car_event.dart';
import 'package:aster_retsa_cars_rental/bloc/car_bloc/car_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import '../models/car.dart';
import '../seeder/brand_seeder.dart';
import '../seeder/car_seeder.dart';
import '../widgets/home_page_widget/app_bar_widget.dart';
import '../widgets/home_page_widget/available_cars_widget/avaible_cars_widget.dart';
import '../widgets/home_page_widget/brand_widget.dart';
import '../widgets/home_page_widget/filter_widget.dart';
import '../widgets/home_page_widget/offer_widget.dart';
import '../widgets/home_page_widget/search_field_widget.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _brands = BrandSeeder().getListBrand();
  final CarBloc _carBloc = CarBloc();

  @override
  void initState() {
    _carBloc.add(FetchCarsEvent());
    super.initState();
  }

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
      body: BlocProvider(
        create: (context) => CarBloc()..add(FetchCarsEvent()),
        child: BlocBuilder<CarBloc, CarState>(
          bloc: _carBloc,
          builder: (context, state) {
            if (state is LoadedCarState) {
              List<Car> cars = state.cars;
              return ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  Car car = cars[index];
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
                      CustomOfferWidget(car: car),
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
                        child: CustomAvailableCarsWidget(availableCars: cars),
                      )
                    ],
                  );
                },
              );
            } else if (state is ErrorCarState) {
              return Center(
                child: Text('Error: ${state.error}'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

/*
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
                child: car.available ? CustomAvailableCarsWidget(availableCars: _cars) : const SizedBox(),
              )
            ],
          );
        },
      ),
    );
  }
*/
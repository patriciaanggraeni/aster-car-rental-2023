import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:src/home_page/model/CarSeeder.dart';
import 'package:src/home_page/widgets/app_bar_widget.dart';
import 'package:src/home_page/widgets/filter_widget.dart';
import 'package:src/home_page/widgets/offer_widget.dart';
import 'package:src/home_page/widgets/search_field_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final cars = CarSeeder().getListCar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea (
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                CustomAppBarWidget(),
                SizedBox(height: 30,),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomSearchFieldWidget(),
                    CustomFilterWidget()
                  ],
                ),
                SizedBox(height: 25,),
                CustomOfferWidget(cars: cars),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
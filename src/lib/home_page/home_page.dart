import 'package:flutter/material.dart';
import 'package:src/home_page/widgets/app_bar_widget.dart';
import 'package:src/home_page/widgets/search_field_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea (
        child: Container(
          child: const Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                CustomAppBarWidget(),
                SizedBox(height: 30,),
                CustomSearchFieldWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
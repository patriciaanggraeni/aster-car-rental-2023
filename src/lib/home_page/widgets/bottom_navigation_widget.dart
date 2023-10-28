import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:src/home_page/home_page.dart';

class CustomBottomNavigationWidget extends StatefulWidget {
  CustomBottomNavigationWidget({super.key, required this.currentPage, required this.pageController});
  int currentPage;
  final PageController pageController;

  @override
  State<CustomBottomNavigationWidget> createState() => _CustomBottomNavigationWidgetState();
}

class _CustomBottomNavigationWidgetState extends State<CustomBottomNavigationWidget> {

  @override
  Widget build(BuildContext context) {
    return BottomBar(
      selectedIndex: widget.currentPage,
      onTap: (index) {
        widget.pageController.jumpToPage(index);
        widget.currentPage = index;
      },
      items: [
        BottomBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
          activeColor: Colors.blue,
          activeTitleColor: Colors.blue.shade600,
        ),
        const BottomBarItem(
          icon: Icon(Icons.favorite),
          title: Text('Favorites'),
          activeColor: Colors.red,
        ),
        BottomBarItem(
          icon: Icon(Icons.person),
          title: Text('Account'),
          backgroundColorOpacity: 0.1,
          activeColor: Colors.greenAccent.shade700,
        ),
        BottomBarItem(
          icon: Icon(Icons.settings),
          title: Text('Settings'),
          activeColor: Colors.orange,
          activeIconColor: Colors.orange.shade600,
          activeTitleColor: Colors.orange.shade700,
        ),
      ],
    );
  }
}

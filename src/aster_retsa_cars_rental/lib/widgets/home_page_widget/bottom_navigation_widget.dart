import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';

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
      items: const [
        BottomBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
          activeColor: Color(0xFF222525),
          activeIconColor: Colors.white,
          activeTitleColor: Colors.white,
          backgroundColorOpacity: 1,
        ),
        BottomBarItem(
          icon: Icon(Icons.history),
          title: Text('Hostory'),
          activeColor: Color(0xFF222525),
          activeIconColor: Colors.white,
          activeTitleColor: Colors.white,
          backgroundColorOpacity: 1,
        ),
        BottomBarItem(
          icon: Icon(Icons.login),
          title: Text('login'),
          activeColor: Color(0xFF222525),
          activeIconColor: Colors.white,
          activeTitleColor: Colors.white,
          backgroundColorOpacity: 1,
        ),
         BottomBarItem(
          icon: Icon(Icons.app_registration),
          title: Text('register'),
          activeColor: Color(0xFF222525),
          activeIconColor: Colors.white,
          activeTitleColor: Colors.white,
          backgroundColorOpacity: 1,
        ),
        BottomBarItem(
          icon: Icon(Icons.details),
          title: Text('About'),
          activeColor: Color(0xFF222525),
          activeIconColor: Colors.white,
          activeTitleColor: Colors.white,
          backgroundColorOpacity: 1,
        ),
      ],
    );
  }
}

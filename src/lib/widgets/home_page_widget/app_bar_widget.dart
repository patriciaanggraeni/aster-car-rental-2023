import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:src/pages/menu_page.dart';
import 'package:src/pages/profile_page.dart';
import 'greeting_widget.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CustomGreetingWidget(),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                  ctx: context,
                  child: const MenuPage(),
                  inheritTheme: true,
                  duration: const Duration(milliseconds: 500),
                  type: PageTransitionType.topToBottom,
              ),
            );
          },
          child: Image.asset(
            "assets/icons/account.png",
            width: 35,
            color: const Color(0xFF222525),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

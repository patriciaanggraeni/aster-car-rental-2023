import 'package:flutter/material.dart';
import 'package:src/pages/profile_page.dart';
import 'greeting_widget.dart';

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Image.asset(
              "assets/icons/menu.png",
              color: const Color(0xFF222525),
              width: 35,
            ),
            const SizedBox(width: 15,),
            const CustomGreetingWidget(),
          ],
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ProfilePage()),
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
  Size get preferredSize =>  const Size.fromHeight(kToolbarHeight);
}
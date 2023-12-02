import 'package:aster_retsa_cars_rental/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'about_page.dart';
import 'history_page.dart';
import 'home_page.dart';
import 'login_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
         'My Profile',
          style: GoogleFonts.poppins(
            color: Colors.white,
          ),
        ),
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 25,
              ),
              onPressed: () {
                 Navigator.push(
                  context,
                  PageTransition(
                    ctx: context,
                    child: const HomePage(),
                    inheritTheme: true,
                    duration: const Duration(milliseconds: 500),
                    type: PageTransitionType.bottomToTop,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/icons/account.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Username',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'User ID: 5263783',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            ItemMenuWidget(
              name: 'History',
              icon: Icons.history,
              toPage: HistoryPage(),
            ),
            const ItemMenuWidget(
              name: 'About',
              icon: Icons.info_outline,
              toPage: About(),
            ),
            const ItemMenuWidget(
              name: 'Logout',
              icon: Icons.logout,
              toPage: LoginPage(),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemMenuWidget extends StatelessWidget {
  const ItemMenuWidget(
      {super.key,
      required this.name,
      required this.icon,
      required this.toPage});

  final String name;
  final IconData icon;
  final Widget toPage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            ctx: context,
            child: toPage,
            inheritTheme: true,
            alignment: Alignment.bottomCenter,
            duration: const Duration(milliseconds: 500),
            type: PageTransitionType.size,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: const BoxDecoration(
          border: BorderDirectional(
            bottom: BorderSide(color: Colors.black12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 28,
                  color: const Color(0xFF222525),
                ),
                const SizedBox(width: 8),
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 16,
              color: Color(0xFF222525),
            )
          ],
        ),
      ),
    );
  }
}

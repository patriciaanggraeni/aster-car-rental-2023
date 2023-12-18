import 'package:aster_retsa_cars_rental/pages/updateData_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'login_page.dart';
import 'menu_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Back',
          style: GoogleFonts.poppins(
            color: const Color(0xFF222525),
          ),
        ),
        elevation: 1,
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 25,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    ctx: context,
                    child: const MenuPage(),
                    inheritTheme: true,
                    duration: const Duration(milliseconds: 500),
                    type: PageTransitionType.bottomToTop,
                  ),
                );
              },
            ),
            // const SizedBox(width: 1),
            // Text(
            //   'Back',
            //   style: GoogleFonts.poppins(
            //     color: Colors.black,
            //     fontSize: 14,
            //     fontWeight: FontWeight.normal,
            //   ),
            // ),
          ],
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.all(1),
                    padding: const EdgeInsets.all(16.0),
                    child: DefaultTextStyle(
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 50, // Atur lebar sesuai kebutuhan
                            height: 50, // Atur tinggi sesuai kebutuhan
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("assets/icons/account.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 25),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Username\n',
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
                  Container(
                    width: 500,
                    margin: const EdgeInsets.symmetric(vertical: 50),
                    child: Card(
                      color: Colors.black,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: DefaultTextStyle(
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Text(
                                'IDENTITY\n',
                                style: TextStyle(
                                  fontWeight: FontWeight
                                      .bold, 
                                ),
                              ),
                              const Text(
                                  'NIK\t\t\t\t                                             4444\n'),
                              const Text(
                                  'Name\t\t                                         Tuan Muda\n'),
                              const Text(
                                  'Sex\t                                               Male\n'),
                              const Text(
                                  'Date of Birth\t\t                             02 July\n'),
                              const Text(
                                  'Address\t                                      Soehat'),
                              const SizedBox(height: 50, width: 400),
                              Align(
                                alignment: Alignment.center,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.white,
                                    minimumSize: const Size(345, 50),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const UpdateDataPage(),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.update),
                                  label: Text(
                                    'Update Data',
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        minimumSize: const Size(345, 50),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.logout),
                      label: Text(
                        'Logout',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

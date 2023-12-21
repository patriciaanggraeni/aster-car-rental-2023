import 'package:aster_retsa_cars_rental/bloc/profile_bloc/profile_bloc.dart';
import 'package:aster_retsa_cars_rental/bloc/profile_bloc/profile_event.dart';
import 'package:aster_retsa_cars_rental/bloc/profile_bloc/profile_state.dart';
import 'package:aster_retsa_cars_rental/models/user.dart' as profile;
import 'package:aster_retsa_cars_rental/pages/updateData_page.dart';
import 'package:aster_retsa_cars_rental/utils/auth_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'login_page.dart';
import 'menu_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileBloc()..add(LoadUserProfile(AuthUtils.getCurrentUserId())),
      child: Scaffold(
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
                      child: MenuPage(),
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
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is UserProfileLoaded) {
              return UserProfile(user: state.user);
            } else if (state is ProfileInitial) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(child: Text('Something went wrong!'));
            }
          },
        ),
      ),
    );
  }
}

class UserProfile extends StatelessWidget {
  const UserProfile({super.key, required this.user});

  final profile.User user;

  @override
  Widget build(BuildContext context) {
    return Center(
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
                        const SizedBox(width: 25),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ID : ${user.id}'),
                              Text('Email: ${user.email}'),
                            ],
                          ),
                        )
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
                      borderRadius: BorderRadius.all(Radius.circular(20)),
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
                            const Center(
                              child: Text(
                                'IDENTITY\n',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Text(
                                'NIK\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t:  ${user.nik}'),
                            Text(
                                'Name\t\t\t\t\t\t\t\t\t\t\t\t\t:  ${user.name}'),
                            Text(
                                'Sex\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t :  ${user.sex}'),
                            Text('Date of Birth\t: ${user.dateOfBirth}'),
                            Text('Address\t\t\t\t\t\t\t\t\t: ${user.address}'),
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          BlocProvider<ProfileBloc>(
                                        create: (context) => ProfileBloc(),
                                        child: UpdateDataPage(user: user),
                                      ),
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
                      signUserOut(context);
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
    );
  }

  void signUserOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}

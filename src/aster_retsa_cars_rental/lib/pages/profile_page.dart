import 'package:aster_retsa_cars_rental/bloc/user_bloc/user_bloc.dart';
import 'package:aster_retsa_cars_rental/bloc/user_bloc/user_event.dart';
import 'package:aster_retsa_cars_rental/bloc/user_bloc/user_state.dart';
import 'package:aster_retsa_cars_rental/pages/updateData_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'login_page.dart';
import 'menu_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, this.updatedUser}) : super(key: key);
  final User? updatedUser;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final UserBloc _userBloc = UserBloc();
  final User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    _userBloc.add(FetchUserEvent());
    super.initState();
  }

 // Tambahkan parameter untuk menerima objek User yang diperbarui
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
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Username : ${currentUser?.displayName ?? 'Tidak ada '}',
                                  // overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  'User ID: ${currentUser?.uid ?? 'Tidak Diketahui'}',
                                ),
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
                          child: BlocProvider(
                            create: (context) => UserBloc()..add(FetchUserEvent()),
                            child: BlocBuilder<UserBloc, UserState>(
                              bloc: _userBloc,
                              builder: (context, state) {
                                if (state is LoadedUserState) {
                                  return Column(
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
                                        'NIK\t\t\t\t\t\t\t\t\t\t\t :  ${state.users[0].nik ?? 'Tidak ada data'}\n',
                                      ),
                                      Text(
                                        'Name\t\t\t\t\t\t :  ${state.users[0].name ?? 'Tidak ada data'}\n',
                                      ),
                                      Text(
                                        'Sex\t\t\t\t\t\t\t\t\t\t :  ${state.users[0].sex ?? 'Tidak ada data'}\n',
                                      ),
                                      Text(
                                        'Date of Birth : \t\t ${state.users[0].dateOfBirth ?? 'Tidak ada data'}\n',
                                      ),
                                      Text(
                                        'Address : \t\t ${state.users[0].address ?? 'Tidak ada data'}\n',
                                      ),
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
                                                builder: (context) =>
                                                    const UpdateDataPage(),
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
                                  );
                                } else if (state is ErrorUserState) {
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

  Future<void> getUserData() async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      // Mendapatkan data pengguna dari Firebase Firestore
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection('user').doc(currentUser.uid).get();

      // Membaca data dari snapshot
      if (userSnapshot.exists) {
        Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;

        // Menggunakan data pengguna
        String displayName = userData['displayName'] ?? 'Tidak ada data';
        String sex = userData['sex'] ?? 'Tidak ada data';
        String dateOfBirth = userData['dateOfBirth'] ?? 'Tidak ada data';
        String address = userData['address'] ?? 'Tidak ada data';

        // Gunakan data tersebut sesuai kebutuhan
        print('DisplayName: $displayName');
        print('Sex: $sex');
        print('Date of Birth: $dateOfBirth');
        print('Address: $address');
      } else {
        print('Dokumen pengguna tidak ditemukan.');
      }
    }
  }
}

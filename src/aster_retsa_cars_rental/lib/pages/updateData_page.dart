import 'package:aster_retsa_cars_rental/pages/profile_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateDataPage extends StatefulWidget {
  const UpdateDataPage({Key? key}) : super(key: key);

  @override
  _UpdateDataPageState createState() => _UpdateDataPageState();
}

class _UpdateDataPageState extends State<UpdateDataPage> {
  final nameController = TextEditingController();
  final sexController = TextEditingController();
  final dobController = TextEditingController();
  final addressController = TextEditingController();

  bool isLoading = false;

   @override
  void initState() {
    super.initState();
    // Memanggil fungsi untuk mengambil dan menetapkan nilai awal pada controller
    fetchDataAndFillControllers();
  }
  // Fungsi untuk menyimpan perubahan data pengguna
  Future<void> fetchDataAndFillControllers() async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      // Mendapatkan data pengguna dari Firebase Firestore
      DocumentSnapshot userSnapshot =
          await FirebaseFirestore.instance.collection('user').doc(currentUser.uid).get();

      // Membaca data dari snapshot dan mengisi controller
      if (userSnapshot.exists) {
        Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;

        nameController.text = userData['fullName'] ?? '';
        sexController.text = userData['sex'] ?? '';
        dobController.text = userData['birth'] ?? '';
        addressController.text = userData['address'] ?? '';
      } else {
        print('Dokumen pengguna tidak ditemukan.');
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Update your data here!',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: sexController,
              decoration: const InputDecoration(labelText: 'Sex'),
            ),
            TextFormField(
              controller: dobController,
              decoration: const InputDecoration(labelText: 'Date of Birth'),
            ),
            TextFormField(
              controller: addressController,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  // Set isLoading ke true saat tombol ditekan
                  setState(() {
                    isLoading = true;
                  });

                  

                  // Panggil fungsi untuk mengambil dan menetapkan nilai awal pada controller
                  await fetchDataAndFillControllers();

                  // Simulasikan proses penyimpanan (Anda dapat menggantinya dengan logika penyimpanan yang sesungguhnya)
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ),
                    );
                    setState(() {
                      isLoading = false; // Set isLoading ke false setelah selesai
                    });
                  });
                },
                child: const Text('Save Changes'),
              ),
            ),


            if (isLoading) // Tampilkan indikator loading dan pesan saat isLoading adalah true
            const Center(
              child: Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text("Updating your data..."),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Bebaskan sumber daya controller saat halaman ditutup
    nameController.dispose();
    sexController.dispose();
    dobController.dispose();
    addressController.dispose();
    super.dispose();
  }
}

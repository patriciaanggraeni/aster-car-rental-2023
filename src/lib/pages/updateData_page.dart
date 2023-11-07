import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:src/pages/profile_page.dart';

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
                onPressed: () {
                  // Set isLoading ke true saat tombol ditekan
                  setState(() {
                    isLoading = true;
                  });

                  // Simulasikan proses penyimpanan (Anda dapat menggantinya dengan logika penyimpanan yang sesungguhnya)
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.pushReplacement(context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
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

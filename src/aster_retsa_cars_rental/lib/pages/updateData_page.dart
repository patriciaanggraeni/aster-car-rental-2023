import 'package:aster_retsa_cars_rental/bloc/profile_bloc/profile_bloc.dart';
import 'package:aster_retsa_cars_rental/bloc/profile_bloc/profile_event.dart';
import 'package:aster_retsa_cars_rental/models/user.dart';
import 'package:aster_retsa_cars_rental/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateDataPage extends StatefulWidget {
  const UpdateDataPage({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<UpdateDataPage> createState() => _UpdateDataPageState();
}

class _UpdateDataPageState extends State<UpdateDataPage> {
  late TextEditingController _nameController;
  late TextEditingController _nikController;
  late TextEditingController _sexController;
  late TextEditingController _addressController;
  late TextEditingController _dateOfBirthController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name);
    _nikController = TextEditingController(text: widget.user.nik);
    _sexController = TextEditingController(text: widget.user.sex);
    _addressController = TextEditingController(text: widget.user.address);
    _dateOfBirthController =
        TextEditingController(text: widget.user.dateOfBirth);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nikController.dispose();
    _sexController.dispose();
    _addressController.dispose();
    _dateOfBirthController.dispose();
    super.dispose();
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
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: _nikController,
              decoration: const InputDecoration(labelText: 'NIK'),
            ),
            TextFormField(
              controller: _sexController,
              decoration: const InputDecoration(labelText: 'Sex'),
            ),
            TextFormField(
              controller: _dateOfBirthController,
              decoration: const InputDecoration(labelText: 'Date of Birth'),
            ),
            TextFormField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  BlocProvider.of<ProfileBloc>(context).add(
                    UpdateUserProfile(
                      widget.user.copyWith(
                        name: _nameController.text,
                        nik: _nikController.text,
                        address: _addressController.text,
                        dateOfBirth: _dateOfBirthController.text,
                        sex: _sexController.text,
                      ),
                    ),
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    ),
                  );
                },
                child: const Text('Save Changes'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

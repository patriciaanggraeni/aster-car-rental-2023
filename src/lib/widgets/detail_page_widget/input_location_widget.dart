import 'package:flutter/material.dart';

import 'section_title_widget.dart';

class InputLocationWidget extends StatelessWidget {
  const InputLocationWidget({super.key, required this.location});

  final String location;

  @override
  Widget build(BuildContext context) {
    TextEditingController locationController = TextEditingController();
    locationController.text = location;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 15,
              top: 30,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close, size: 24),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(36),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SectionTitleWidget(title: 'Pickup Location'),
                    const SizedBox(height: 16),
                    TextField(
                      controller: locationController,
                      autofocus: true,
                      decoration:
                          const InputDecoration(hintText: 'Enter location'),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Color.fromRGBO(25, 25, 25, 1),
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                10,
                              ),
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context, locationController.text);
                      },
                      child: const Text(
                        'Confirm',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
